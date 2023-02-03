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

# [[ COMPLETTION ]]
# from old config
autoload -U compinit && compinit
zmodload -i zsh/complist

# man zshcontrib
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git #svn cvs
# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# insert all expansions for expand completer
# zstyle ':completion:*:expand:*' tag-order all-expansions
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

# [[ ASDF ]]
# this will add ~/.asdf/bin and ~/.asdf/shims to $PATH
. $HOME/.asdf/asdf.sh
# append completions to fpath
# see https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit . $HOME/.asdf/completions/asdf.bash
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

# [[ HISTORY ]]
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
HISTSAVE=9000
# HISTFILE=~/.zsh_history

# [[ PLUGINS ]]
# see https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
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
# see https://github.com/hertogp/dotfiles
# `-> created via:
#    $ cd ~/dev/ && git clone --bare git@github.com:hertogp/dotfiles.git
# - DOTFILES points to a bare git repo that uses $HOME as working tree
# - $HOME/.gitignore has $DOTFILES to ignore
# - bare repo has status.showUntrackedFiles no
#   (git --git-dir=$DOTFILES --work-tree=$HOME config status.showUntrackedFiles no)
# - manually add individual files:
#   $ config add <a file in home dir>
#   $ config commit
#   $ config push
#   $ config status
#   $ config ls-tree -r HEAD  (to see tracked files)
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

# [[ FUNCTIONS ]]
export ACCTDIR=~/.acct
pw ()
{
    PREVDIR=$(pwd)
    cd "${HOME}/.acct"
    if [ -z "${1}" ]; then
        echo "need file, e.g. one of:"
        echo  $(ls *.gpg)
        echo ""
        echo "or a new filename .."
    else
        nvim "${1}.gpg"
    fi
    cd ${PREVDIR}
}

export NOTESDIR=~/notes
nn ()
{
    # nn [<topic>]
    # nn <topic> --> new/existing note-file
    # nn         --> start nvim w/ list of existing note-files
    PREVDIR=$(pwd)
    cd ${NOTESDIR}
    nvim -c ":Telescope find_files"
    cd ${PREVDIR}
}

# [[ SYNTAX ]]
# sudo apt install zsh-syntax-highlighting
# see https://github.com/zsh-users/zsh-syntax-highlighting
# this must be the last line in ~/.zshrc
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
