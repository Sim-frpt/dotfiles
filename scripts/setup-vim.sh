#!/bin/bash

vim_plug_location="${HOME}/.vim/autoload/plug.vim"

if [ ! -f ${vim_plug_location} ]; then
  echo "####################"
  echo "Installing vim-plug..."
  echo "####################"
  curl -fLo ${vim_plug_location} --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim -es "${HOME}/.vimrc" -i NONE -c "PlugInstall" -c "qa"

echo "vim-plug is setup and plugins are installed"

# Download a nerd font compatible font for vim devicons
mkdir -p ~/.local/share/fonts
  echo "####################"
  echo "Installing nerd font compatible font..."
  echo "####################"
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
