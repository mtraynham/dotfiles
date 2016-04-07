#!/usr/bin/env bash

# Cli Tools
xcode-select --install

# HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew tap caskroom/cask
brew install brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# ZSH
brew install zsh
chsh -s `which zsh`
# Copy SSH Id
brew install copy-ssh-id
# Subversion
brew install subversion
# Git
brew install git
# Tig
brew install tig
# Hub
brew install hub
# Vim
brew install macvim
# JDK 8
brew cask install java
# Maven
brew install maven
# Gradle
brew install gradle
# NVM
brew install nvm
# Pyenv
brew install pyenv
# Rbenv
brew install rbenv
brew install ruby-build
# Irssi
brew install irssi
# Wget
brew install wget
# FontConfig
brew install fontconfig
# Fortune
brew install fortune
# Cowsay
brew install cowsay
# Flux
brew cask install flux
# Caffeine
brew cask install caffeine
# Sublime Text 3
brew cask install sublime-text3
# iTerm2
brew cask install iterm2
# IntelliJ
brew cask install intellij-idea
# Chrome
brew cask install google-chrome
# Firefox
brew cask install firefox
# Atom
brew cask install atom
# Slack
brew cask install slack
# Spotify
brew cask install spotify
# Little Snitch
brew cask install little-snitch
# IStat Menus
brew cask install istat-menus
# Adium
brew cask install adium
# Alfred
brew cask install alfred
# Dropbox
brew cask install dropbox
# OpenOffice
brew cask install openoffice
# Cyberduck
brew cask install cyberduck
# VLC
brew cask install vlc
# The Unarchiver
brew cask install the-unarchiver

# For fun R/Hive/Pig/Spark
brew install gcc
brew install Caskroom/cask/xquartz
brew install r
brew install hive
brew install pig
brew install apache-spark

# Powerline Fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
mkdir $HOME/Library/Fonts
mv PowerlineSymbols.otf $HOME/Library/Fonts
git clone --depth 1 https://github.com/Lokaltog/powerline-fonts.git $HOME/Library/Fonts/powerline-fonts
fc-cache -vf $HOME/Library/Fonts
