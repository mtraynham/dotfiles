#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# OS Specific packages
cp -rs ${dir}/config/* $HOME/
if [ "$(uname)" == "Darwin" ]; then
    cp -rs ${dir}/config.osx/* $HOME/
    ${dir}/install.osx.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    cp -rs ${dir}/config.ubuntu/* $HOME/
    ${dir}/install.ubuntu.sh
fi

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Powerlevel 9000 theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Powerline fonts
mkdir -p ~/.fonts
git clone https://github.com/powerline/fonts ~/.fonts/powerline-fonts/
~/.fonts/powerline-fonts/install.sh

# Awesome Powerline fonts
git clone https://github.com/gabrielelana/awesome-terminal-fonts.git ~/.fonts/awesome-terminal-fonts
~/.fonts/awesome-terminal-fonts/install.sh

# Source updated files
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
