#!/bin/bash

# NVM
# https://github.com/nvm-sh/nvm
nvm_dir=~/.nvm

git clone https://github.com/nvm-sh/nvm.git nvm_dir
cd nvm_dir
latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout latest_tag
./nvm.sh



