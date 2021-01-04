#!/bin/bash
# Shamelessly stolen from https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/aptinstall.sh

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "####################"
    echo "Installing: ${1}"
    echo "####################"

    sudo apt install -y $1
  else
    echo "####################"
    echo "${1} is already installed"
    echo "####################"
  fi
}

install bat
# See https://github.com/sharkdp/bat
mkdir -p $HOME/.local/bin
ln -s /usr/bin/batcat $HOME/.local/bin/bat
# GCC compiler
install build-essential
install curl
install flameshot
install fonts-cascadia-code
install figlet
install fzf
install gimp
install git
install htop
install fonts-powerline
install tmux
install vim
install xclip
install zsh

