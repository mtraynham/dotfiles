# Debug start up times
# zmodload zsh/zprof

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# RBENV
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NVM
if [ ! -d  "$HOME/.nvm/current" ] ; then
    export NVM_SYMLINK_CURRENT=true
fi
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # NVM may already be loaded, not sure if this is necssary?
export PATH=$PATH:$NVM_DIR/current/bin

# THE FUCK
eval "$(thefuck --alias)"

# Source aliases
source $HOME/.aliases