#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${dir}
git pull

# OS Specific packages
cp -rs ${dir}/config/* $HOME/
if [ "$(uname)" == "Darwin" ]; then
    cp -rs ${dir}/config.osx/* $HOME/
    brew update
    brew upgrade
    brew cleanup
    brew cask cleanup
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    cp -rs ${dir}/config.ubuntu/* $HOME/
    ${dir}/install.ubuntu.sh
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get autoremove
fi

# Upgrade oh-my-zsh
upgrade_oh_my_zsh


