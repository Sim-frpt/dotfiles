#!/bin/bash

# Rbenv
# https://github.com/rbenv/rbenv

echo "####################"
echo "Installing rbenv"
echo "####################"

rbenv_dir=$HOME/.rbenv
git clone https://github.com/rbenv/rbenv.git $rbenv_dir
cd $rbenv_dir && src/configure && make -C src
$rbenv_dir/bin/rbenv init

# Install ruby-build as an rbenv plugin
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
