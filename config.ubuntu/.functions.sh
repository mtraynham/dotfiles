#!/usr/bin/env bash

function git-checkout-latest-tag {
	git fetch --tags
	tag=$(git describe --tags `git rev-list --tags --max-count=1`)
	echo "Checking out tag $tag..."
	git checkout "$tag"
}

function upgrade-node {
    versions=`nvm ls-remote`
    installed=`echo $versions | egrep -- "->" | tail -n 1 | egrep -o 'v[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+'`
    latest=`echo $versions | tail -n 1 | egrep -o 'v[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+'`
    if [ $installed == $latest ]; then
        echo 'Node versions match, skipping node upgrade'
    else
        echo "Node versions do not match, upgrading to $latest..."
        nvm install $latest
        nvm alias default $latest
        nvm use $latest
        nvm copy-packages $installed
        nvm uninstall $installed
    fi
    npm update -g
}

function upgrade-all {
    sudo apt-get update;
    sudo apt-get upgrade;
    sudo apt-get autoremove;
    (source $HOME/.aliases && pip-upgrade)
    upgrade-node
    vim +PlugUpdate +qall && (cd $HOME/.vim/plugged/YouCompleteMe && ./install.py)
    (cd $HOME/.git-extras/ && git-checkout-latest-tag && sudo ./install.sh)
    (cd $HOME/.pyenv/ && git-checkout-latest-tag)
    (cd $HOME/.rbenv/ && git-checkout-latest-tag)
    (cd $HOME/.rbenv/plugins/ruby-build && git-checkout-latest-tag)
    (cd $HOME/.oh-my-zsh/custom/themes/powerlevel9k/ && git-checkout-latest-tag)
}
