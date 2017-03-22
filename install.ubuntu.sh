#!/usr/bin/env bash

# Oracle Java PPA
sudo apt-get --yes --force-yes install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
# Sublime Text 3 PPA
sudo add-apt-repository ppa:webupd8team/sublime-text-3
# Atom PPA
sudo add-apt-repository ppa:webupd8team/atom
# Git PPA
sudo add-apt-repository ppa:git-core/ppa
# Hub PPA
sudo add-apt-repository ppa:cpick/hub
# Maven3 PPA
sudo add-apt-repository ppa:andrei-pozolotin/maven3
# Gradle PPA
sudo add-apt-repository ppa:cwchien/gradle
# Neovim PPA
sudo add-apt-repository ppa:neovim-ppa/unstable
# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
# Docker
if [ ! -e /usr/lib/apt/methods/https ]; then
	sudo apt-get update
	sudo apt-get install -y apt-transport-https
fi
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo deb https://get.docker.com/ubuntu docker main | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update

# Base
sudo apt-get --yes --force-yes install make build-essential cmake gfortran \
    libatlas-base-dev python-dev python3-dev \
    build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev curl llvm libncurses5-dev \
    libncursesw5-dev
sudo apt-get --yes --force-yes install zsh
chsh -s `which zsh`
sudo apt-get --yes --force-yes install xclip
sudo apt-get --yes --force-yes install subversion
sudo apt-get --yes --force-yes install atom
sudo apt-get --yes --force-yes install git
sudo apt-get --yes --force-yes install tig
sudo apt-get --yes --force-yes install hub
sudo apt-get --yes --force-yes install vim
sudo apt-get --yes --force-yes install neovim
sudo apt-get --yes --force-yes install oracle-java8-installer
sudo apt-get --yes --force-yes install oracle-java8-set-default
sudo apt-get --yes --force-yes install maven3
sudo apt-get --yes --force-yes install gradle
sudo apt-get --yes --force-yes install irssi
sudo apt-get --yes --force-yes install wget
sudo apt-get --yes --force-yes install fortune
sudo apt-get --yes --force-yes install cowsay
sudo apt-get --yes --force-yes install sublime-text-installer
sudo apt-get --yes --force-yes install terminator
sudo apt-get --yes --force-yes install google-chrome-stable
sudo apt-get --yes --force-yes install firefox
sudo apt-get --yes --force-yes install conky
sudo apt-get --yes --force-yes install spotify-client-0.9.17
# sudo apt-get --yes --force-yes install spotify-client  # Broken on Mint 17.3
sudo apt-get --yes --force-yes install nautilus-dropbox
sudo apt-get --yes --force-yes install filezilla
sudo apt-get --yes --force-yes install tmpreaper
# Docker
sudo apt-get --yes --force-yes install linux-image-extra-$(uname -r)
sudo apt-get --yes --force-yes install apparmor
sudo apt-get --yes --force-yes install docker-engine

sudo apt-get update
sudo apt-get upgrade

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.0.3-amd64.deb -P /tmp/
sudo apt-get --yes --force-yes install /tmp/slack-desktop-2.0.3-amd64.deb

# Rbenv
if [ ! -d "$HOME/.rbenv" ]; then
    git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
    (cd $HOME/.rbenv && src/configure && make -C src)
    git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

# Pyenv
if [ ! -d "$HOME/.pyenv" ]; then
    git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
fi

# NVM
if [ ! -d "$HOME/.nvm" ]; then
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
fi

# Git-Extras
if [ ! -d "$HOME/.git-extras" ]; then
    git clone https://github.com/tj/git-extras.git $HOME/.git-extras
fi
