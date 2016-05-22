#!/usr/bin/env bash

function brew-cask-upgrade() {
    # https://gist.githubusercontent.com/atais/9c72e469b1cbec35c7c430ce03de2a6b/raw/1b7b891e6eff3b42edb4ada219764f12aefb04ca/cask_upgrade.sh
    (set -x; brew update;)
    (set -x; brew cask update;)
    (set -x; brew cleanup;)
    (set -x; brew cask cleanup;)

    red=`tput setaf 1`
    green=`tput setaf 2`
    reset=`tput sgr0`

    casks=( $(brew cask list) )

    for cask in ${casks[@]}
    do
        installed="$(brew cask info $cask | grep 'Not installed')"
        if [[ $installed = *[!\ ]* ]]; then
            echo "${red}${cask}${reset} requires ${red}update${reset}."
            (set -x; brew cask uninstall $cask --force;)
            (set -x; brew cask install $cask --force;)
        else
            echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
        fi
    done
}