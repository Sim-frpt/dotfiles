#!/bin/bash

# TLDR

echo "####################"
echo "Installing TLDR"
echo "####################"

loc=/usr/local/bin/tldr
sudo wget -qO $loc https://4e4.win/tldr
sudo chmod +x $loc
