#!/usr/bin/env bash

# OS Specific packages
if [ "$(uname)" == "Darwin" ]; then
    ./install.ubuntu.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    ./install.ubuntu.sh
fi

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Rbenv
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
cd $HOME/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build

# Pyenv
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv

# NVM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

[ -e "${HOME}/.zshenv" ] && source "${HOME}/.zshenv"
[ -e "${HOME}/.zprofile" ] && source "${HOME}/.zprofile"
[ -e "${HOME}/.zshrc" ] && source "${HOME}/.zshrc"

# Latest Ruby
latest=`rbenv install -l | egrep '^[[:space:]]+[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+$' | tail -1 | xargs echo`
rbenv install ${latest}
rbenv global ${latest}
gem install bundler

# Python 2.X
two_latest=`pyenv install -l | egrep '^[[:space:]]+2\.[[:digit:]]+\.[[:digit:]]+$' | tail -1 | xargs echo`
pyenv install ${two_latest}
pyenv shell ${two_latest}
pip install -r python/requirements.txt --upgrade

# Latest Python
latest=`pyenv install -l | egrep '^[[:space:]]+[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+$' | tail -1 | xargs echo`
pyenv install ${latest}
pyenv global ${latest}
pyenv shell ${latest}
pip install -r python/requirements.txt --upgrade

# Latest Node
latest=`nvm ls-remote | egrep '^[[:space:]]+v[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+$' | tail -1 | xargs echo`
nvm install ${latest}
nvm alias default ${latest}
packages=`tr '\n' ' ' < js/global-npm.txt`
npm install -g ${packages}