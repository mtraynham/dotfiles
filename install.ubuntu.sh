#!/usr/bin/env bash

# Oracle Java PPA
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
# Sublime Text 3 PPA
sudo add-apt-repository ppa:webupd8team/sublime-text-3
# Atom PPA
sudo add-apt-repository ppa:webupd8team/atom
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
sudo apt-get -y install make build-essential cmake gfortran libatlas-base-dev python-dev python3-dev \
    build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev curl llvm libncurses5-dev libncursesw5-dev
sudo apt-get -y install zsh
chsh -s `which zsh`
sudo apt-get -y install xclip
sudo apt-get -y install subversion
sudo apt-get -y install atom
sudo apt-get -y install git
sudo apt-get -y install tig
sudo apt-get -y install hub
sudo apt-get -y install vim
sudo apt-get -y install oracle-java8-installer
sudo apt-get -y install maven
sudo apt-get -y install gradle
sudo apt-get -y install irssi
sudo apt-get -y install wget
sudo apt-get -y install fortune
sudo apt-get -y install cowsay
sudo apt-get -y install sublime-text-installer
sudo apt-get -y install terminator
sudo apt-get -y install google-chrome-stable
sudo apt-get -y install firefox
sudo apt-get -y install conky
sudo apt-get -y install spotify-client
sudo apt-get -y install nautilus-dropbox
sudo apt-get -y install filezilla
sudo apt-get -y install tmpreaper

sudo apt-get update
sudo apt-get upgrade

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.0.3-amd64.deb -P /tmp/
sudo apt-get -y install /tmp/slack-desktop-2.0.3-amd64.deb

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
