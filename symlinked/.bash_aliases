alias lsock='sudo netstat -ntulp'
alias lsu='sudo du -hsc $(ls -lpA  | awk '"'"'/^d/ {print $9}'"'"')'
alias ls.system='sudo inxi -c 29 -b'
alias touchpad_off='xinput set-prop $(xinput list | grep -i glide | egrep -o id=[[:digit:]]+ | egrep -o [[:digit:]]+) "Device Enabled" 0'
alias touchpad_on='xinput set-prop $(xinput list | grep -i glide | egrep -o id=[[:digit:]]+ | egrep -o [[:digit:]]+) "Device Enabled" 1'

# an ls variant, most recently touched ends up last in the list.
alias lt='ls -thralp'

# goto special directories quickly
alias cdw='cd /home/www/dwark'
alias cdr='cd /home/www/work'
alias cdp='cd /home/dta/work/proj'
alias cdv='cd ~/.vim'
alias pssh='proxychains ssh'

