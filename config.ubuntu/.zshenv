# Debug start up times
# zmodload zsh/zprof

# Terminal only supports 256 colors
export TERM="xterm-256color"

# PYENV
export PYTHON_CONFIGURE_OPTS="--enable-shared"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# RBENV
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # NVM may already be loaded, not sure if this is necssary?
export PATH=$PATH:$NVM_DIR/current/bin

# PERL
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# BRO
export BRO_DIR="/usr/local/bro/bin"
export PATH=$PATH:$BRO_DIR

# THE FUCK
eval "$(thefuck --alias)"

# Set HADOOP
# export HADOOP_HOME="/opt/hadoop/hadoop-2.8.3"
# export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native/:$LD_LIBRARY_PATH
# export PATH=$PATH:$HADOOP_HOME/bin

# Set SPARK
# export SPARK_HOME="/opt/spark/spark-2.2.1-bin-hadoop2.7"
# export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
# export PATH=$PATH:$SPARK_HOME/bin

# Source functions
source ~/.functions.sh

# Source aliases
source ~/.aliases
