#!/usr/bin/env bash

# Cli Tools
xcode-select --install

# HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew tap caskroom/cask
brew install brew-cask

# ZSH
brew install zsh
chsh -s `which zsh`
# Subversion
brew install subversion
# Git
brew install git
# Vim
brew install macvim
# JDK 8
brew cask install java
# Maven
brew install maven
# Gradle
brew install gradle
# Wget
brew install  wget
# Irssi
brew install irssi
# Fortune
brew install fortune
# Cowsay
brew install cowsay
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

# For fun R/Hive/Pig/Spark
brew install gcc
brew install Caskroom/cask/xquartz
brew install r
brew install hive
brew install pig
brew install apache-spark

# Copy all config
cp -R config/* $HOME/
cp -R config.osx/* $HOME/

# Powerline Fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
mkdir $HOME/Library/Fonts
mv PowerlineSymbols.otf $HOME/Library/Fonts
git clone --depth 1 https://github.com/Lokaltog/powerline-fonts.git $HOME/Library/Fonts/powerline-fonts
fc-cache -vf $HOME/Library/Fonts
