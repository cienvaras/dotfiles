# PHP
export PATH="$PATH:$HOME/.composer/vendor/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship
eval "$(starship init zsh)"

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/andres'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

# exa.
alias ls='exa --color always --icons'
alias ll='exa --long --color always --icons'
alias la='exa --all --color always --icons'
alias lla='exa --long --all --color always'

#nvim.
alias v='nvim'

# Enable vi mode
bindkey -v
bindkey "^?" backward-delete-char
