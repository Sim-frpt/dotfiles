#!/bin/bash

# This is a set of preferences for the Ubuntu desktop env
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.input-sources xkb-options ['caps:escape']
gsettings set org.gnome.desktop.wm.keybindings switch-input-source ['<Primary>space']
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
# Lower keyboard repeat delay to 200 (faster repeat when holding down a key)
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
# Lower keyboard repeat interval
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval uint32 25



