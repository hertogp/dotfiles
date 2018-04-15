# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# echo ".bashrc `date +%Y-%m-%d,%H:%M:%S` sourced." >> ~/log/shell.log
# VIM {{{1 

# A terminal interprets the chars on its input and captures <C-q>/<C-s> which
# it interprets as start/stop characters, which are keymaps I want to use
# inside vim inside a terminal.  Hence the function below:
vim()
{
    # osx users, use stty -g
    local STTYOPTS="$(stty --save)"     # save terminal settings
    stty stop '' -ixoff                 # turn off Xon/Xoff
    command vim "$@"
    stty "$STTYOPTS"                    # restore terminal settings
}

ACCTDIR=~/.acct
pw ()
{
    PREVDIR=$(pwd)
    cd "${ACCTDIR}"
    # open with NERDTree if no filename was given
    if [ -z "${1}" ]; then
        echo "need file, e.g. one of:"
        echo  $(ls *.gpg)
        echo ""
        echo "or a new filename .."
    else
        vim "${1}.gpg"
    fi
    cd ${PREVDIR}
}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# user color TERM
TERM="xterm-256color"
export TERM

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#some more aliases
alias ll='find . -type d'
alias lt='ls -ltr'
alias la='ls -A'
alias l='ls -lpah'
alias loadvirtualenv='source /etc/bash_completion.d/virtualenvwrapper'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# pdh stuff below
export PATH=$PATH:/home/pdh/bin:/home/pdh/.cabal/bin
export PYTHONPATH=${PYTHONPATH}:~/lib/python
export GLE_USRLIB=~/lib/gle
# For gnupg.vim plugin, see http://www.vim.org/scripts/script.php?script_id=3645
GPG_TTY=`tty`
export GPG_TTY

# NVIM settings
# - nvim sends Esc 2q and Esc 6q to which xcfe4-terminal just echo's
export NVIM_TUI_ENABLE_CURSOR_SHAPE=0

# use solarized dircolors
eval `dircolors ~/.dir_colors`

# virtualenv stuff
# export WORKON_HOME="$HOME/virtualenvirons"
# commented out cause it slows down starting a new shell.
# - use the alias loadvirtualenv before 'workon <project>'
#source /etc/bash_completion.d/virtualenvwrapper

# map caps to control
# - alternative: setxkbmap -option 'ctrl:nocaps'
# xmodmap ~/.xmodmaprc
# - show current keyboard options: setxkbmap -query
setxkbmap -option 'ctrl:nocaps'

# Use US keyboard layout, variant ALTGR-INTL
# - right-alt key to get éÉ-characters².
# - not sure if bashrc is the best place to do this
# - see https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg
# - couldn't find anything in /etc/X11
# - see /etc/default/keyboard
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# Test italics in terminal.  Echo $ITALIC to see if the terminal supports
# italics.  Make sure the terminal is using a font that has italics builtin.
ITALIC="[3mitalic?[23m"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
