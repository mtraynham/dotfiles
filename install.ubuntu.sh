#!/usr/bin/env bash

# Oracle Java PPA
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
# Sublime Text 3 PPA
sudo add-apt-repository ppa:webupd8team/sublime-text-3
# Git PPA
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get upgrade


# Base
sudo apt-get install build-essential cmake gfortran libatlas-base-dev python-dev python3-dev
# ZSH
sudo apt-get install zsh
chsh -s `which zsh`
# Xclip
sudo apt-get install xclip
# Subversion
sudo apt-get install subversion
# Git
sudo apt-get install git
# Vim
sudo apt-get install vim
# Pip
sudo apt-get install python-pip
# JDK 8
sudo apt-get install oracle-java8-installer
# Maven
sudo apt-get install maven
# Gradle
sudo apt-get install gradle
# Wget
sudo apt-get install wget
# Sublime Text 3
sudo apt-get install sublime-text-installer
# Terminator
sudo apt-get install terminator
# Chrome
sudo apt-get install google-chrome-stable
# Firefox
sudo apt-get install firefox
# Fortune
sudo apt-get install fortune
# Cowsay
sudo apt-get install cowsay

# Copy all config
cp -R config/* $HOME/
cp -R config.ubuntu/* $HOME/

# Install Powerline
pip install --user git+git://github.com/Lokaltog/powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p $HOME/.fonts/
mv PowerlineSymbols.otf $HOME/.fonts/
fc-cache -vf $HOME/.fonts
mkdir -p $HOME/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/
