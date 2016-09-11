#!/usr/bin/env bash

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
    (set -x; brew cask update;)
    (brew-cask-upgrade;)
    (set -x; brew cleanup;)
    (set -x; brew prune;)
    (set -x; brew cask cleanup;)
}
