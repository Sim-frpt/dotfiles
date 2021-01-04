#!/bin/bash

figlet 'setting up ubuntu machine'

echo '------------------------------------------------------------'
echo 'Configuring desktop -> ./ubuntu-configure-desktop.sh'
echo '------------------------------------------------------------'
./ubuntu-configure-desktop.sh
echo '------------------------------------------------------------'
echo 'Installing apt packages -> ./apt-install.sh'
echo '------------------------------------------------------------'
./apt-install.sh
echo '------------------------------------------------------------'
echo 'Installing apps -> ./install-programs.sh'
echo '------------------------------------------------------------'
./install-programs.sh
echo '------------------------------------------------------------'
echo 'Setting up vim -> ./setup-vim.sh'
echo '------------------------------------------------------------'
./setup-vim.sh
echo '------------------------------------------------------------'
echo 'Creating symlinks -> ./setup-vim.sh'
echo '------------------------------------------------------------'
./symlink.sh

read -p -s -n 1 "Do you wish to configure the current gnome-terminal profile? y/n " configure_term

# check against '\x0a' is checking if enter was pressed
if [ $configure_term == 'y' ] || [ $configure_term == 'Y'] || [ $configure_term == $'\x0a' ]; then
  echo '------------------------------------------------------------'
  echo 'Configuring gnome-terminal profile -> ./ubuntu-configure-term-profile.sh'
  echo '------------------------------------------------------------'
  ./ubuntu-configure-term-profile.sh
else
  echo "You can manually configure your terminal profile by running ./ubuntu-configure-term-profile.sh"
fi

figlet "we're back..."
