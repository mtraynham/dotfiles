#!/usr/bin/env bash

function export_aws_key {
  local profile=${1:=default}
  export AWS_ACCESS_KEY=`aws configure get aws_access_key_id --profile $profile`
  export AWS_ACCESS_KEY_ID=`aws configure get aws_access_key_id --profile $profile`
  export AWS_SECRET_KEY=`aws configure get aws_secret_access_key --profile $profile`
  export AWS_SECRET_ACCESS_KEY=`aws configure get aws_secret_access_key --profile $profile`
}

function brew-cask-upgrade {
    red=`tput setaf 1`
    green=`tput setaf 2`
    reset=`tput sgr0`
    installed=$(brew cask list --versions)
    echo "$installed" | while read line; do
        app=$(echo $line | awk '{print $1;}')
        latest=$(brew cask _stanza version $app)
        tests=$(echo $line | grep $latest)
        if [ -z "$tests" ]; then
            echo "$line < $latest"
            echo "${red}${app}${reset} requires ${red}update${reset}."
            (set -x; brew cask uninstall $app --force;)
            (set -x; brew cask install $app --force;)
        else
            echo "${red}${app}${reset} is ${green}up-to-date${reset}."
        fi
    done
}

function brew-upgrade {
    # https://gist.githubusercontent.com/atais/9c72e469b1cbec35c7c430ce03de2a6b/raw/1b7b891e6eff3b42edb4ada219764f12aefb04ca/cask_upgrade.sh
    (set -x; brew update;)
    (set -x; brew upgrade;)
    (set -x; brew cask upgrade;)
    (brew-cask-upgrade;)
    (set -x; brew cleanup --prune-prefix;)
}

function node-upgrade {
    versions=`nvm ls-remote`
    installed=`echo $versions | egrep -- "->" | tail -n 1 | egrep -o 'v[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+'`
    latest=`echo $versions | tail -n 1 | egrep -o 'v[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+'`
    if [ "$installed" = "$latest" ]; then
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

function zsh-upgrade {
    upgrade_oh_my_zsh
    (cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull --all)
}

function upgrade-all {
    (cd ~/Documents && brew-upgrade);
    pip-upgrade;
    node-upgrade;
    zsh-upgrade;
    vim +PlugUpdate +qall && (cd ~/.vim/plugged/YouCompleteMe && ./install.py);
}
