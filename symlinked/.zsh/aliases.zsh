alias l='ls -laph --color'
alias lt='tree -aI .git'
alias lr='ls -thralp'
alias touchpad_off='xinput set-prop $(xinput list | grep -i glide | egrep -o id=[[:digit:]]+ | egrep -o [[:digit:]]+) "Device Enabled" 0'
alias touchpad_on='xinput set-prop $(xinput list | grep -i glide | egrep -o id=[[:digit:]]+ | egrep -o [[:digit:]]+) "Device Enabled" 1'
alias ls.usage='sudo du -hsc $(ls -lpA  | awk '"'"'/^d/ {print $9}'"'"')'
alias ls.system='sudo inxi -c 29 -b'
alias ls.sockets='sudo netstat -ntulp'
alias cdw='cd /home/www/dwark'
alias cdr='cd /home/www/work'
alias cdp='cd /home/dta/work/proj'
alias cdv='cd ~/.vim'

# -------------------------------------------------------------------
# Ruby stuff
# -------------------------------------------------------------------
alias ri='ri -Tf ansi' # Search Ruby documentation
alias rake="noglob rake" # necessary to make rake work inside of zsh
#alias be='bundle exec'
#alias bx='bundle exec'
#alias gentags='ctags .'

# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias 'bk=cd $OLDPWD'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gss='git status -sbu'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
#alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1,2 | sort | uniq -c | sort -nr'

# curiosities
# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"


# -------------------------------------------------------------------
# Python virtualenv 
# -------------------------------------------------------------------
alias mkenv='mkvirtualenv'
alias on="workon"
alias off="deactivate"

# Force tmux to use 256 colors
alias tmux='TERM=screen-256color-bce tmux'

# -------------------------------------------------------------------
# Source: http://aur.archlinux.org/packages/lolbash/lolbash/lolbash.sh
# -------------------------------------------------------------------
alias wtf='dmesg'
alias onoz='cat /var/log/errors.log'
alias rtfm='man'
alias plz='pwd'
alias inur='locate'
alias nomz='ps aux | less'
