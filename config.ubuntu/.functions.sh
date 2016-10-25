#!/usr/bin/env bash

function git-checkout-latest-tag {
	git fetch --tags
	TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
	echo "Checking out tag $TAG..."
	git checkout "$TAG"
}

function upgrade-all {
    sudo apt-get update;
    sudo apt-get upgrade;
    sudo apt-get autoremove;
    pip-upgrade;
    vim +PlugUpdate +qall;
    pushd ~/.vim/plugged/YouCompleteMe && ./install.py && popd;
    pushd ~/.git-extras/ && git-checkout-latest-tag && sudo ./install.sh && popd;
    pushd ~/.pyenv/ && git-checkout-latest-tag && popd;
    pushd ~/.rbenv/ && git-checkout-latest-tag && popd;
    pushd ~/.rbenv/plugins/ruby-build && git-checkout-latest-tag && popd;
    pushd ~/.oh-my-zsh/custom/themes/powerlevel9k/ && git-checkout-latest-tag && popd;
}