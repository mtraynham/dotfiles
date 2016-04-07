#!/usr/bin/env bash

# Oracle Java PPA
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
# Sublime Text 3 PPA
sudo add-apt-repository ppa:webupd8team/sublime-text-3
# Git PPA
sudo add-apt-repository ppa:git-core/ppa
# Hub PPA
sudo add-apt-repository ppa:cpick/hub
# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"

sudo apt-get update

# Base
sudo apt-get -y install build-essential cmake gfortran libatlas-base-dev python-dev python3-dev
# ZSH
sudo apt-get -y install zsh
chsh -s `which zsh`
# Xclip
sudo apt-get -y install xclip
# Subversion
sudo apt-get -y install subversion
# Git
sudo apt-get -y install git
# Tig
sudo apt-get -y install tig
# Hub
sudo apt-get -y install hub
# Vim
sudo apt-get -y install vim
# JDK 8
sudo apt-get -y install oracle-java8-installer
# Maven
sudo apt-get -y install maven
# Gradle
sudo apt-get -y install gradle
# Irssi
sudo apt-get -y install irssi
# Wget
sudo apt-get -y install wget
# Fortune
sudo apt-get -y install fortune
# Cowsay
sudo apt-get -y install cowsay
# Sublime Text 3
sudo apt-get -y install sublime-text-installer
# Terminator
sudo apt-get -y install terminator
# Chrome
sudo apt-get -y install google-chrome-stable
# Firefox
sudo apt-get -y install firefox
# Conky
sudo apt-get -y install conky
# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.0.3-amd64.deb -P /tmp/
sudo apt-get -y install /tmp/slack-desktop-2.0.3-amd64.deb
# Spotify
sudo apt-get -y install spotify-client
# Dropbox
sudo apt-get -y install nautilus-dropbox
# Filezilla
sudo apt-get -y install filezilla
# TMPReaper
sudo apt-get -y install tmpreaper

sudo apt-get update
sudo apt-get upgrade

# Rbenv
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
cd $HOME/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build

# Pyenv
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv

# NVM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# Install Powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p $HOME/.fonts/
mv PowerlineSymbols.otf $HOME/.fonts/
fc-cache -vf $HOME/.fonts
mkdir -p $HOME/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/
