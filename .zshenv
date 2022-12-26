# There are 5 zsh startup files:
# .zshenv   - sourced on ALL invocations -> meant for export paths & environment vars
# .zprofile - alternative for .zlogin (sourced before .zshrc)
# .zshrc    - sourced for interactive shells -> aliases, funcs, options, keybindings etc ..
# .zlogin   - sourced for login shells- -> for external cmds like banner, motd..
# .zlogout  - source upon logout

# DEBUG logger
# echo ".zshenv `date +%Y-%m-%d,%H:%M:%S` sourced." >> ~/log/shell.log

# NVIM settings
# - nvim sends Esc 2q and Esc 6q to which xcfe4-terminal just echo's
export NVIM_TUI_ENABLE_CURSOR_SHAPE=0

# load venv/bin/activate if available when starting new shell
# - makes vim's help ('K') work when developing in a virtual environment
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
