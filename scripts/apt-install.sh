#!/bin/bash
# Shamelessly stolen from https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/aptinstall.sh

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1} >>>>"
    sudo apt install -y $1
  else
    echo "${1} is already installed"
  fi
}

install bat
# See https://github.com/sharkdp/bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
install curl
install fzf
install gimp
install git
install htop
install fonts-powerline
install ripgrep
install ruby
install tmux
install vim
install xclip
install zsh


# Add Java ppa (used for DBeaver)
#sudo add-apt-repository ppa:linuxuprising/java
#sudo apt update -y
#sudo apt install oracle-java11-installer -y

# Add DBeaver repository 
#wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | apt-key add -

# Install Insomnia
# Add to sources
#echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    #| sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
#wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    #| sudo apt-key add -

# Refresh repository sources and install Insomnia
#sudo apt update
#sudo apt install insomnia

read -p "Would you like to set zsh as your default shell? y/n " set_as_default

if [ $set_as_default == "y" ] || [ $set_as_default == "Y" ]; then
  chsh -s $(which zsh)
fi
