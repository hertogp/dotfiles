# Functions {{{1
function virtualenv_info { #{{{2
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char { #{{{2
    git branch >/dev/null 2>/dev/null && echo "${PR_BOLD_YELLOW}★%{$reset_color%}" && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
}

function box_name { #{{{2
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
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

function parse_git_branch() { #{{{2
  # Show Git branch/tag, or name-rev if on detached head
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}★%{$reset_color%}"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}+NUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}-NUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}u%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}m%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}s%{$reset_color%}"
function parse_git_state() { #{{{2
  # show symbols depending on Git-repo state
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

function get_git_prompt() { #{{{2
  local GIT_CLEAN=" ${PR_GREEN}✓%{$reset_color%}"
  local GIT_DIRTY=" ${PR_RED}✗%{$reset_color%}"
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    echo $GIT_DIRTY
  elif ! git diff --quiet 2> /dev/null; then
    echo $GIT_DIRTY
  elif ! git diff --cached --quiet 2> /dev/null; then
    echo "$GIT_DIRTY"
  else
    echo "$GIT_CLEAN"
  fi
}
function get_git_branch() { #{{{2
  # If inside a Git repository, print its branch and state
  # Show Git branch/tag, or name-rev if on detached head
  local BRANCH=$(git symbolic-ref -q HEAD 2> /dev/null)
  if [ -z "$BRANCH" ]; then
      BRANCH=$(git name-rev --name-only --no-undefined --always HEAD 2> /dev/null)
  fi
  if [ -n "$BRANCH" ]; then
      BRANCH="${BRANCH#(refs/heads/|tags/)}"

      local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
      if [ "$NUM_AHEAD" -gt 0 ]; then
        BRANCH="$BRANCH +$NUM_AHEAD"
      else
        local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_BEHIND" -gt 0 ]; then
           BRANCH="$BRANCH -$NUM_BEHIND"
        fi
      fi
  fi
   local STATUS=$(parse_git_state)
   if [ -z "$STATUS" ]; then
       echo " %{$fg[green]%}(${BRANCH})%{$reset_color%}"
   else
       echo " %{$fg[red]%}(${BRANCH} ${STATUS}%{$fg[red]%})%{$reset_color%}"
   fi
}

function git_prompt_string() { #{{{2
  # If inside a Git repository, print its branch and state
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo " %{$fg[red]%}(${git_where#(refs/heads/|tags/)})%{$reset_color%}$(parse_git_state)"
}


function current_pwd { #{{{2
  echo $(pwd | sed -e "s,^$HOME,~,")
}
function get_git_root { #{{{2
  local GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n $GIT_ROOT ]]; then
      echo "%{$fg_bold[yellow]%}$(basename $GIT_ROOT)%{$reset_color%}"
  fi
}
function get_usr_host() { #{{{2
  echo "%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}"
}

# PROMPT(s) {{{1
# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# colors {{{2

# ${PR_USR}@${PR_BOX}: $(git_root)$(git_status)

PROMPT='
${PR_GREEN}%n%{$reset_color%}${PR_YELLOW}@%{$reset_color%}${PR_GREEN}$(box_name)%{$reset_color%}%{$FG[239]%}:%{$reset_color%}${PR_BOLD_YELLOW}$(git_root)%{$reset_color%}$(git_prompt_string)$(prompt_char) '

PROMPT='
$(get_usr_host): $(get_git_root)$(get_git_branch)$(get_git_prompt) '

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

# ri-prompt {{{2
RPROMPT='${PR_GREEN}$(virtualenv_info)%{$reset_color%} ${PR_RED}${ruby_version}%{$reset_color%}'
