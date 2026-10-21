
### OMZ Config ###

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# aliases
source $HOME/.aliases

# use vim key bindings
bindkey -v

# NVM config
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# FZF
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 40% --popup bottom,40% --layout reverse --border top'
