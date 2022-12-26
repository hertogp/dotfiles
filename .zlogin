# .zlogin is sourced by login shells

# signal our login to all (user) session upstart jobs, e.g.
# - gitit
echo ".zlogin `date +%Y-%m-%d,%H:%M:%S` sourced." >> ~/log/shell.log
