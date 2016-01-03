# There are 5 zsh startup files:
# .zshenv   - sourced on ALL invocations -> meant for export paths & environment vars
# .zprofile - alternative for .zlogin (sourced before .zshrc)
# .zshrc    - sourced for interactive shells -> aliases, funcs, options, keybindings etc ..
# .zlogin   - sourced for login shells- -> for external cmds like banner, motd..
# .zlogout  - source upon logout

# For now we have nothing here
# echo ".zshenv `date +%Y-%m-%d,%H:%M:%S` sourced." >> ~/log/shell.log
