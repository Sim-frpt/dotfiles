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
mkdir -p $HOME/.local/bin
ln -s /usr/bin/batcat $HOME/.local/bin/bat
install curl
install flameshot
install fonts-cascadia-code
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

read -p "Would you like to set zsh as your default shell? y/n " set_as_default

if [ $set_as_default == "y" ] || [ $set_as_default == "Y" ]; then
  chsh -s $(which zsh)
fi
