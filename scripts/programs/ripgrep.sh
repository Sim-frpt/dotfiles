#!/bin/bash

# RipGrep

# Should be able to install via apt, but issue with Bat package. see https://bugs.launchpad.net/ubuntu/+source/rust-bat/+bug/1868517/comments/32 for this solution.

echo "##########"
echo "Installing RipGrep"
echo "##########"

sudo apt download ripgrep
sudo dpkg --force-overwrite -i ripgrep*.deb
rm ripgrep*.deb
