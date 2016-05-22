# Debug start up times
# zmodload zsh/zprof

# HomeBrew Cask Options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Spark
export PYSPARK_PYTHON=python3

# Hive
# Set $HIVE_HOME in your profile:
export HIVE_HOME=$(brew --prefix hive)/libexec
# If you want to use HCatalog with Pig, set $HCAT_HOME in your profile:
export HCAT_HOME=$HIVE_HOME/hcatalog
# You may need to set JAVA_HOME:
export JAVA_HOME="$(/usr/libexec/java_home)"

# NVM http://stackoverflow.com/questions/28017374/what-is-the-suggested-way-to-install-brew-node-js-io-js-nvm-npm-on-os-x
if [ ! -d  "$HOME/.nvm/current" ] ; then
    export NVM_SYMLINK_CURRENT=true
fi
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH=$PATH:$NVM_DIR/current/bin

# TheFuck
eval "$(thefuck --alias)"

# Export brew packages
export PATH=$PATH:/usr/local/sbin

# Source aliases
source $HOME/.aliases

# Source functions
source $HOME/.functions.sh