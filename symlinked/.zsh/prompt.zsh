# See also:
# - http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up
# - http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# - https://gist.github.com/4415470
# - https://gist.github.com/1712320

# Functions {{{1
function _update_ruby_version() { #{{{2
  # Get active ruby version using rbenv or rvm
  typeset -g ruby_version=''
  which rbenv 1>/dev/null 2>/dev/null && ruby_version=${${(A)="$(rbenv version)"}[1]:l} && return
  which rvm 1>/dev/null 2>/dev/null && ruby_version="$(rvm i v g)" && return
  ruby_version="<?>"
}

# Only update global ruby_version when changing directories
chpwd_functions+=(_update_ruby_version)

function addon_gitty(){  #{{{2
  # (arrays hashes) declared inside funcs are local by nature
  local GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
  [[ -z $GIT_ROOT ]] && return

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

  # First, build traffic lights based on flags
  local state=""
  [[ -n ${field[ahead]} ]]  && state="$state%{$fg[cyan]%}+${field[ahead]}"
  [[ -n ${field[behind]} ]] && state="$state%{$fg[cyan]%}-${field[behind]}"
  ${field[modified]}  && state="${state}%{$fg_bold[red]%}●%{$reset_color%}"
  ${field[staged]}    && state="${state}%{$fg_bold[green]%}●%{$reset_color%}"
  ${field[untracked]} && state="${state}%{$fg_bold[magenta]%}●%{$reset_color%}"
  ${field[ignored]}   && state="${state}%{$fg_bold[cyan]%}●%{$reset_color%}"
  ${field[conflict]}  && state="${state}%{$fg_bold[red]%}⚡︎%{$reset_color%}"
  [[ -n $state ]]     && state="%{$fg[red][%{$reset_color%}$state%{$fg[red]%}]%{$reset_color%}"

  local msg=""
  msg="%{$fg_bold[yellow]%}$(basename $GIT_ROOT)%{$reset_color%}"
  msg+=" %{$fg[red]%}(${field[branch]}%)%{$reset_color%}$state"
  [[ -z $state ]] && msg="$msg %{$fg_bold[yellow]%}✓ %{$reset_color%}"
  [[ -n $state ]] && msg="$msg %{$fg_bold[red]%}✗ %{$reset_color%}"
  echo "$msg← "
}

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# PROMPT(s) {{{1

# left-prompt {{{2
PROMPT='
%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%} → $(addon_gitty)%~
%# '

# sprompt {{{2
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

# right-prompt {{{2
RPROMPT='%{$fg[red]%}[${ruby_version}]%{$reset_color%}'
