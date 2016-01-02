# See https://http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
#
echo ".zshrc `date +%Y-%m-%d,%H:%M:%S` start sourcing." >> ~/log/zshell.log
source ~/.zsh/checks.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh
source  ${HOME}/dotfiles/z/z.sh
echo ".zshrc `date +%Y-%m-%d,%H:%M:%S` done sourcing." >> ~/log/zshell.log
