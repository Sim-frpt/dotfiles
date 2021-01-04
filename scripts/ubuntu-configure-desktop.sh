#!/bin/bash

. "$(pwd)/utils.sh"

# This is a set of preferences for the Ubuntu desktop env
change_setting org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
change_setting org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 34
change_setting org.gnome.desktop.interface gtk-theme 'Yaru-dark'
change_setting org.gnome.desktop.input-sources xkb-options "['caps:escape']"
change_setting org.gnome.desktop.wm.keybindings switch-input-source "['<Primary>space']"
change_setting org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Primary><Shift>space']"
change_setting org.gnome.desktop.peripherals.mouse natural-scroll false
change_setting org.gnome.desktop.peripherals.touchpad natural-scroll false
change_setting org.gtk.Settings.FileChooser show-hidden true

# Lower keyboard repeat delay to 200 (faster repeat when holding down a key) and lower keyboard repeat interval
change_setting org.gnome.desktop.peripherals.keyboard delay 200
change_setting org.gnome.desktop.peripherals.keyboard repeat-interval 50

# Various night light settings
change_setting org.gnome.settings-daemon.plugins.color night-light-temperature 3228
change_setting org.gnome.settings-daemon.plugins.color night-light-enabled true
change_setting org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
change_setting org.gnome.settings-daemon.plugins.color night-light-schedule-to 10.0
change_setting org.gnome.settings-daemon.plugins.color night-light-schedule-from 17.0

# Download gnome-terminal theme
mkdir -p "${HOME}/src"
cd "${HOME}/src"
git clone https://github.com/Mayccoll/Gogh.git gogh
cd gogh/themes

# necessary on ubuntu
export TERMINAL=gnome-terminal

# install theme
./gruvbox-dark.sh

rm -rf "${HOME}/src"
