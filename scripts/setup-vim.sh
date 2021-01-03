#!/bin/bash

vim_plug_location="${HOME}/.vim/autoload/plug.vim"

if [ ! -f ${vim_plug_location} ]; then
  echo "Installing vim-plug..."
  curl -fLo ${vim_plug_location} --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim -es "${HOME}/.vimrc" -i NONE -c "PlugInstall" -c "qa"

echo "vim-plug is setup and plugins are installed"
