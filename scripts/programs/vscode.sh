#!/bin/bash

# Visual Studio Code

echo "####################"
echo "Installing Visual Studio Code"
echo "####################"

# https://code.visualstudio.com/docs/setup/linux
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
rm microsoft.gpg

function install {
  code --install-extension $1
}

install CoenraadS.bracket-pair-colorizer-2
install dbaeumer.vscode-eslint
install dsznajder.es7-react-js-snippets
install dunstontc.viml
install Equinusocio.vsc-community-material-theme
install Equinusocio.vsc-material-theme
install equinusocio.vsc-material-theme-icons
install esbenp.prettier-vscode
install formulahendry.auto-rename-tag
install ms-mssql.mssql
install pixelbyte-studios.pixelbyte-love2d
install ritwickdey.LiveServer
install xabikos.JavaScriptSnippets
install yzhang.markdown-all-in-one
