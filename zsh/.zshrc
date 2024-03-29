# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

################################
# ZSH CONFIG

#So as not to be disturbed by Ctrl-S (hangs terminal) ctrl-Q in terminals:
stty -ixon

# Change Histfile location
HISTFILE=~/.dotfiles/.zsh/.zsh_history

# Set vim as preferred editor
export EDITOR=vim

# Use vim bindings in shell
bindkey -v


#####################################
# ITERM2 SHELL CONFIGURATION        #
#####################################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

#####################################
# RUBY CONFIG                       #
#####################################
#export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

#####################################
# FZF CONFIG                        #
#####################################
# Source fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Change fzf default config
if [[ -f ~/.fzf.zsh ]] then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi

#####################################
# BAT CONFIG
export BAT_THEME="ansi"

#####################################
# ALIASES SOURCING
[ -f $HOME/.aliases ] && source $HOME/.aliases

#####################################
# NVM CONFIG
# This export is used to mitigate the slow startup of my shell when I use nvm. This slow start is due to nvm checking which node version to auto-use based on .nvmrc or a similar config file.
# There is a flag for skipping this check, but then you have to supply a fallback to a preferred version for fast access.
# See https://www.ioannispoulakas.com/2020/02/22/how-to-speed-up-shell-load-while-using-nvm/ for full details.
# Feels a bit hacky with nvm_node_v, but that will do for now
export NVM_DIR="$HOME/.nvm"

if [ -d "$NVM_DIR/versions/node" ]; then
    node_version=$(ls ~/.nvm/versions/node/ | sort -t '.' -k2 -nr | head -1)
    export PATH=~/.nvm/versions/node/$node_version/bin:$PATH
fi

# Source NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# MYSQL
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

# PYTHON
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

