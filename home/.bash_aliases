alias mf='find . -type -f -print0 | xargs -0 mv -t /home/dta/ebooks'
alias lsock='sudo netstat -ntulp'
alias lsu='sudo du -hsc $(ls -lpA  | awk '"'"'/^d/ {print $9}'"'"')'
alias bu-mail='sudo rsync -hauvz --no-D -n /home/vmail/ /media/backup/backup/cajun/home/vmail/'
alias asus-up="mtpfs -o allow_other /home/pdh/mnt/asus"
alias asus-down="fusermount -u /home/pdh/mnt/asus"
alias mk.nav='for f in $(ls *.mp4); do mencoder -profile nav $f -o ${f/mp4/avi}; done'
alias adoc='asciidoc -v -a icons -a toc2'
alias ls.system='sudo inxi -c 29 -b'
alias touchpad_off='xinput set-prop $(xinput list | grep -i glide | egrep -o id=[[:digit:]]+ | egrep -o [[:digit:]]+) "Device Enabled" 0'
alias touchpad_on='xinput set-prop $(xinput list | grep -i glide | egrep -o id=[[:digit:]]+ | egrep -o [[:digit:]]+) "Device Enabled" 1'

# an ls variant, most recently touched ends up last in the list.
alias lt='ls -thralp'

# goto special directories quickly
alias cdc='cd /home/www/cert'
alias cdw='cd /home/www/dwark'
alias cdr='cd /home/www/work'
alias cdp='cd /home/dta/work/proj'
alias cdv='cd ~/.vim'
alias mnt_playon='sudo mount -t cifs //192.168.178.2/usb1 /home/pdh/mnt/playon'
alias pssh='proxychains ssh'

