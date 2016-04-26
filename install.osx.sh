#!/usr/bin/env bash

# Cli Tools
xcode-select --install

# HomeBrew and Casks
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew tap caskroom/cask
brew tap caskroom/versions
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# A good set of terminal tools
brew install zsh
chsh -s `which zsh`
brew install copy-ssh-id
brew install subversion
brew install git
brew install git-extras
brew install tig
brew install hub
brew install macvim
brew cask install java
brew install maven
brew install gradle
brew install nvm
brew install pyenv
brew install rbenv
brew install ruby-build
brew install irssi
brew install wget
brew install fontconfig
brew install fortune
brew install cowsay
brew install scala

# Nice apps for Dev
brew cask install flux
brew cask install caffeine
brew cask install sublime-text3
brew cask install iterm2
# brew cask install intellij-idea
brew cask install intellij-idea-eap
brew cask install google-chrome
brew cask install firefox
brew cask install atom
brew cask install slack
brew cask install spotify
brew cask install little-snitch
brew cask install istat-menus
brew cask install adium
brew cask install alfred
brew cask install dropbox
brew cask install openoffice
brew cask install cyberduck
brew cask install vlc
brew cask install the-unarchiver

# For fun R/Hive/Pig/Spark
brew install gcc
brew install r
brew install hive
brew install pig
brew install apache-spark
