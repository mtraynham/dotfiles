#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${dir}

git pull

# OS Specific packages
cp -rs ${dir}/config/* $HOME/
if [ "$(uname)" == "Darwin" ]; then
    cp -rs ${dir}/config.osx/* $HOME/
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    cp -rs ${dir}/config.ubuntu/* $HOME/
fi

# Run the upgrade all script for this system
upgrade-all

# Upgrade oh-my-zsh
upgrade_oh_my_zsh

popd
