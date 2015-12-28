# See also http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up
# - rewrote git prompt a little bit, make it simpler
# Functions {{{1
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

function addon_gitty(){  #{{{2
  # (arrays hashes) declared inside funcs are local by nature
  local GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
  [[ -z $GIT_ROOT ]] && return

  local msg=""
  msg="%{$fg_bold[yellow]%}$(basename $GIT_ROOT)%{$reset_color%}"

  typeset -A field
  field=(branch '' ahead '' behind '')
  field+=(untracked false ignored false staged false modified false conflict false)
  for line in ${(f)"$(git status -bsu --porcelain 2>/dev/null)"}; do
  #for line in ${(f)"$(< tst.log)"}; do
      # [ ! ${line[1]} = ';' ] && echo "line  : >${line}<"
      # See git status --help for explanation of the fields
      case ${line[0,2]} in
          ('##')
              field[branch]=${line[4,-1]/[ .]*}
              [ ! ${line:l} = ${${line:l}#*ahead} ] && field[ahead]=${${${line:l}#*ahead}//[^[:digit:]]/}
              [ ! ${line:l} = ${${line:l}#*behind} ] && field[behind]=${${${line:l}#*behind}//[^[:digit:]]/}
              ;;
          ('??') field[untracked]=true ;;
          ('!!') field[ignored]=true ;;
          ([MARC][ ]) field[staged]=true ;;
          (C[ MD]) field[staged]=true ;;
          ([DAU]*) field[conflict]=true ;;
          # (\;*) ;;
          (*) field[modified]=true ;;
      esac
  done

  # if we don't have a branch, report nothing
  [[ -z ${field[branch]} ]] && return
  # cumulative build of state flags
  local state=""
  [[ -n ${field[ahead]} ]]  && state="$state%{$fg[cyan]%}+${field[ahead]}"
  [[ -n ${field[behind]} ]] && state="$state%{$fg[cyan]%}-${field[behind]}"
  ${field[modified]}  && state="${state}%{$fg[red]%}m"
  ${field[staged]}    && state="${state}%{$fg[green]%}s"
  ${field[untracked]} && state="${state}%{$fg[yellow]%}u"
  ${field[ignored]}   && state="${state}%{$fg[cyan]%}i"
  ${field[conflict]}  && state="${state}%{$fg_bold[red]%}⚡︎%{$reset_color%}"
  [[ -n $state ]]     && state=" $state"

  msg+=" %{$fg[red]%}(${field[branch]}$state%{$fg[red]%})"
  [[ -z $state ]] && msg="${msg}%{$fg_bold[yellow]%} ✓ %{$reset_color%}"
  [[ -n $state ]] && msg="${msg}%{$fg_bold[red]%} ✗ %{$reset_color%}"
  echo $msg
}
#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt
# PROMPT(s) {{{1
# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

# Get_gitty
# Create git status flags from $(git status -bsu --porcelain)

# left-prompt {{{2
# echo "%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}"
PROMPT='
%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}%# $(addon_gitty)'

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

# right-prompt {{{2
RPROMPT='${PR_RED}${ruby_version}%{$reset_color%}'

