# Debug start up times
# zmodload zsh/zprof

# HomeBrew Cask Options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Pyenv
export PYTHON_CONFIGURE_OPTS="--enable-framework CC=clang"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"
export PYENV_ROOT=$HOME/.pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Rbenv
export RBENV_ROOT=$HOME/.rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# NVM http://stackoverflow.com/questions/28017374/what-is-the-suggested-way-to-install-brew-node-js-io-js-nvm-npm-on-os-x
if [ ! -d  "$HOME/.nvm/current" ] ; then
    export NVM_SYMLINK_CURRENT=true
fi
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH=$PATH:$NVM_DIR/current/bin

# TheFuck
eval "$(thefuck --alias)"

# IDEA
export IDEA_SCRIPTS_DIR="$HOME/Library/Application Support/JetBrains/Toolbox"
export PATH=$PATH:$IDEA_SCRIPTS_DIR

# Ansible
export ANSIBLE_NOCOWS=1

# Export brew packages
export PATH=$PATH:/usr/local/sbin

# Source aliases
source $HOME/.aliases

# Source functions
source $HOME/.functions.sh
