# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# [[ XDG EXPORTS ]]
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# [[ PYLIB ]]
# ~/lib/python is back.
export PYTHONPATH=${PYTHONPATH}:~/lib/python
export PYTHONSTARTUP=${HOME}/.pythonstartup.py
export GLE_USRLIB=~/lib/gle
export PATH=/snap/bin:$HOME/.local/bin:$GOBIN:$PATH
# For gnupg.vim plugin, see http://www.vim.org/scripts/script.php?script_id=3645
GPG_TTY=`tty`
export GPG_TTY


# [[ ASDF ]]
# - will ~/.asdf/bin and ~/.asdf/shims to PATH
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# https://github.com/asdf-vm/asdf-erlang#ubuntu-2004-lts
# https://github.com/asdf-vm/asdf-erlang#getting-erlang-documentation
export KERL_BUILD_DOCS=yes
export KERL_INSTALL_HTMLDOCS=no
export ASDF_LUA_LINUX_READLINE=1

# [[ THEME ]]
# see https://ohmyz.sh/#install
# `-> sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# creates ~/.oh-my-zsh
# see https://github.com/ohmyzsh/ohmyzsh/
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# note: using starship instead.
ZSH_THEME="bira"

# [[ STARSHIP ]]
# install/update via: curl -sS https://starship.rs/install.sh | sh
# silence starship about command timeout (i.e. elixir)
export STARSHIP_LOG='error'

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 16

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# [[ USER CONFIGURATION ]]

export MANPATH="/usr/local/man:$MANPATH"

# [[ DOTFILES ]]
# see https://www.atlassian.com/git/tutorials/dotfiles
# see https://marcel.is/managing-dotfiles-with-git-bare-repo/
# - DOTFILES points to a bare git repo that uses $HOME as working tree
# - $HOME/.gitignore has $DOTFILES to ignore
# - bare repo has status.showUntrackedFiles no
#   (git --git-dir=$DOTFILES --work-tree=$HOME config status.showUntrackedFiles no)
# - manually add individual files:
#   $ config add <a file in home dir>
#   $ config commit
#   $ config push
#   $ config status
export DOTFILES="$HOME/dev/dotfiles"
alias config='git --git-dir=$DOTFILES --work-tree=$HOME'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# [[ ALIAS ]]
# TODO: should this go to ZSH_CUSTOM folder?
# [[ generic ]]
alias l='ls -laph --color=auto'
alias lt='tree -aI .git'
alias lr='ls -thralp --color=auto'
alias ls.usage='sudo du -hsc $(ls -lpA  | awk '"'"'/^d/ {print $9}'"'"')'
alias ls.system='sudo inxi -c 29 -b'
alias ls.sockets='sudo netstat -ntulp'
alias cdw='cd /home/www/dwark'
alias cdn='cd /home/www/notes'
alias cdr='cd /home/www/work'
alias cdp='cd /home/dta/work/proj'
alias cdv='cd ~/.vim'
# keep env variables when running sudo (eg for LUAPATH)
alias sudo='sudo -E'

# [[ directory ]]
alias ..='cd ..'
alias 'bk=cd $OLDPWD'

# [[ git ]]
alias ga='git add'
alias gp='git push'
alias gl='git log --oneline'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gt='git tag -a'
alias gs='git status'
alias gss='git status -sbu'
alias gc='git checkout'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch -a'
#alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1,2 | sort | uniq -c | sort -nr'
alias git-reset='git fetch origin master && git reset --hard FETCH_HEAD && git clean -df'
alias luamake=/home/pdh/.config/lsp/lua-language-server/3rd/luamake/luamake

# [[ SYNTAX ]]
# sudo apt install zsh-syntax-highlighting
# see https://github.com/zsh-users/zsh-syntax-highlighting
# this must be the last line in ~/.zshrc
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
