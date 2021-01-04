#!/bin/bash

# Oh My Zsh!

echo "####################"
echo "Installing Oh My Zsh!"
echo "####################"

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm install.sh
