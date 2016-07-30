# See also:
# - http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up
# - http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# - https://gist.github.com/4415470
# - https://gist.github.com/1712320

# Functions {{{1
function _update_ruby_version() { #{{{2
  # Get active ruby version using rbenv or rvm
  typeset -g ruby_version=''
  if rbenv 1>/dev/null 2>/dev/null; then
      ruby_version=${${(A)="$(rbenv version)"}[1]:l}
  elif rvm 1>/dev/null 2>/dev/null; then
      ruby_version="$(rvm i v g)"
  else
      ruby_version="?"
  fi
  [ -n $ruby_version ] && ruby_version="%{$fg[red]%}[$ruby_version]%{$reset_color%}"
}

# Only update global ruby_version when changing directories
chpwd_functions+=(_update_ruby_version)

function git_prompt() {  #{{{2
  # <repo name> (branch)[lag][xyz?!] <x|v>
  local GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
  [[ -z "$GIT_ROOT" ]] && return

  # take status flags from git status string (use -bz)
  local GSS=""
  GSS=$(git status -bz 2>/dev/null)
  # build the prompt string
  local state=""  # the [lag][xyz?!] part
  local lag=${${${${GSS//$'\0'*}/\[a/+}/\[b/-}//[^+0-9-]/}    # ahead/behind <n> if any
  # using bold colors requires %{$reset_color%} to go non-bold again
  [[ -n "${lag}" ]] && state+="%{$fg[cyan]%}${lag}"
  # \0?<space> -> changes, idx==wtree -> ready to be committed
  GSSLEN=${#GSS}
  [[ $GSSLEN -gt ${#GSS/$'\0'? } ]] && state+="%{$fg[green]%}●"
  # \0<space>? -> changes, idx!=wtree -> changes need to be staged
  [[ $GSSLEN -gt ${#GSS/$'\0' ?} ]] && state+="%{$fg[red]%}●"
  # \0[^ ?!][ ?!] = 2letters, changes & idx!=wtree and/or unmerged stuff
  [[ $GSSLEN -gt ${#GSS/$'\0'[^ ?!][^ ?!]} ]] && state+="%{$fg[magenta]%}●"
  # \0?? untracked files present (normally shown)
  [[ $GSSLEN -gt ${#GSS/$'\0'\?} ]] && state+="%{$fg[red]%}?"
  # \0!! ignored files present (normally not shown)
  # [[ $GSSLEN -gt ${#GSS/$'\0'!} ]]  && state+="%{$fg[red]%}!"
  [[ -n "$state" ]] && state="%{$fg[red][%{$reset_color%}$state%{$fg[red]%}]%{$reset_color%}"

  # Build the git prompt
  local msg="%{$fg_bold[yellow]%}$(basename $GIT_ROOT)%{$reset_color%}"  # repo in yellow
  msg+="%{$fg[red]%} (${${(s: :)GSS/[$'\0'.]/ }[2]}%)"                   # branch name

  if [[ -z $state ]]; then
      msg+="%{$fg_bold[yellow]%} ✓ %{$reset_color%}"                     # OK, clean
  else
      msg+="${state}%{$fg_bold[red]%} ✗ %{$reset_color%}"                # NOK, dirty
  fi
  echo " → $msg"
}

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# PROMPT(s) {{{1

# left-prompt {{{2
PROMPT='
%{$fg[green]%}%m%{$reset_color%} $(git_prompt)
%# '

# sprompt {{{2
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

# right-prompt {{{2
# RPROMPT='${ruby_version}'
RPROMPT='%(?..(%?%))'
