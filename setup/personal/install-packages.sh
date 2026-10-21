#!/usr/bin/env bash

set -euo pipefail

package="" 

function format_msg {
    echo -e "==> $1 \n"
}

function installing {
    format_msg "Installing $1"
}

function done_installing {
    format_msg "Finished installing $1"
    package=""
}

function already_installed {
    format_msg "$1 already installed"
}

function assert_not_yet_installed  {
    ! type $1 > /dev/null 2>&1; 
}

function set_package {
    package=$1
}

function activate_sudo {
    sudo echo "sudo activated!"
    echo
}


activate_sudo

## PACKAGES ##

## ZSH ##


## Oh My Zsh! ##


## Ghostty ## 
set_package "ghostty"
installing $package

if assert_not_yet_installed $package; then
    sudo dnf copr enable scottames/ghostty
    sudo dnf install ghostty

    done_installing $package
else 
    already_installed $package
fi


## FZF ##
set_package "fzf"
installing "fzf"

if assert_not_yet_installed "fzf"; then
    sudo dnf install fzf

    done_installing $package
else 
    already_installed $package
fi






