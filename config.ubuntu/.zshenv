# Debug start up times
# zmodload zsh/zprof

# Terminal only supports 256 colors
export TERM="xterm-256color"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# RBENV
export RBENV_ROOT=$HOME/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NVM
if [ ! -d  "$HOME/.nvm/current" ] ; then
    export NVM_SYMLINK_CURRENT=true
fi
export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:$NVM_DIR/current/bin

# TheFuck
eval "$(thefuck --alias)"

# Source aliases
source $HOME/.aliases