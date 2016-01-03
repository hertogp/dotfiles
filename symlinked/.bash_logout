# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

# echo ".bash_logout `date +%Y-%m-%d,%H:%M:%S` sourced." >> ~/log/shell.log
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
