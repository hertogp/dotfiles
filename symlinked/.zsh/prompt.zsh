# See also http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up
# - rewrote git prompt a little bit, make it simpler
# Functions {{{1
function virtualenv_info { #{{{2
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# determine Ruby version whether using RVM or rbenv
# the chpwd_functions line cause this to update only when the directory changes
function _update_ruby_version() { #{{{2
    typeset -g ruby_version=''
    if which rvm-prompt &> /dev/null; then
      ruby_version="$(rvm-prompt i v g)"
    else
      if which rbenv &> /dev/null; then
        ruby_version="$(rbenv version | sed -e "s/ (set.*$//")"
      fi
    fi
}
chpwd_functions+=(_update_ruby_version)

function get_usr_host() { #{{{2
  # small wrapper for lots of color stuff around usr@host
  echo "%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}"
}

# TODO: rewrite using the output of git status
# - git status has some interesting flags (like -bs, --porcelain or -bz) that would
#   necessitate only 1 call to git to provide info on whether we're behind or
#   ahead of remote repo, any unstaged, deleted and/or modified files..
# - see git status help
function get_git_status() { #{{{2
  # If inside a Git repository, get (branch +status flags)
  # Show Git branch/tag, or name-rev if on detached head
  local GIT_CLEAN=" ${PR_GREEN}✓%{$reset_color%}"
  local GIT_DIRTY=" ${PR_RED}✗%{$reset_color%}"
  local BRANCH=$(git symbolic-ref -q HEAD 2> /dev/null)
  if [[ -z "$BRANCH" ]]; then
      BRANCH=$(git name-rev --name-only --no-undefined --always HEAD 2> /dev/null)
  fi
  if [[ -n "$BRANCH" ]]; then
      BRANCH="${BRANCH#(refs/heads/|tags/)}"
  fi
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    # num of commit ahead of remote
    GIT_STATE="${GIT_STATE}%{$fg[cyan]%}+${NUM_AHEAD}%{$reset_color%}"
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    # num commits behind the remote repo
    GIT_STATE="${GIT_STATE}%{$fg[red]%}-${NUM_BEHIND}%{$reset_color%}"
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    # merging needed
    GIT_STATE="${GIT_STATE}%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
  fi
  # untracked files
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE="${GIT_STATE}%{$fg[red]%}u%{$reset_color%}"
  fi
  # modified files
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE="${GIT_STATE}%{$fg[yellow]%}m%{$reset_color%}"
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    # we have staged files
    GIT_STATE="${GIT_STATE}%{$fg[green]%}s%{$reset_color%}"
  fi
  if [ -z "$GIT_STATE" ]; then
     echo " %{$fg[green]%}(${BRANCH})%{$reset_color%}${GIT_CLEAN} "
  else
     echo " %{$fg[red]%}(${BRANCH} ${GIT_STATE}%{$fg[red]%})%{$reset_color%}${GIT_DIRTY} "
  fi
}
function get_git_info() { #{{{2
  local GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n $GIT_ROOT ]]; then
      GIT_ROOT="%{$fg_bold[magenta]%}$(basename $GIT_ROOT)%{$reset_color%}"
      local GIT_STATUS="$(get_git_status)"
      echo "${GIT_ROOT}${GIT_STATUS}"
 fi
}

# PROMPT(s) {{{1
# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# left-prompt {{{2
PROMPT='
$(get_usr_host): $(get_git_info)'

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

# right-prompt {{{2
RPROMPT='${PR_GREEN}$(virtualenv_info)%{$reset_color%} ${PR_RED}${ruby_version}%{$reset_color%}'
