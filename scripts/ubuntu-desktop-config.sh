#!/bin/bash

function change_setting {
  schema=$1
  key=$2
  value=$3
  writable=$(gsettings writable $schema $key)

  if [ $? -eq 0 ] && [ $writable == true ]; then
    echo "Changing '${schema}' '${key}' to '${value}'"
    gsettings set $schema $key $value
  else
    echo "ERROR: could not set ${schema} ${key} to ${value}"
  fi
}

# This is a set of preferences for the Ubuntu desktop env
change_setting org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
change_setting org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 34
change_setting org.gnome.desktop.interface gtk-theme 'Yaru-dark'
change_setting org.gnome.desktop.input-sources xkb-options "['caps:escape']"
change_setting org.gnome.desktop.wm.keybindings switch-input-source "['<Primary>space']"
change_setting org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Primary><Shift>space']"
change_setting org.gnome.desktop.peripherals.mouse natural-scroll false
change_setting org.gnome.desktop.peripherals.touchpad natural-scroll false

# Lower keyboard repeat delay to 200 (faster repeat when holding down a key) and lower keyboard repeat interval
change_setting org.gnome.desktop.peripherals.keyboard delay 200
change_setting org.gnome.desktop.peripherals.keyboard repeat-interval 25

# Various night light settings
change_setting org.gnome.settings-daemon.plugins.color night-light-temperature 3228
change_setting org.gnome.settings-daemon.plugins.color night-light-enabled true
change_setting org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
change_setting org.gnome.settings-daemon.plugins.color night-light-schedule-to 10.0
change_setting org.gnome.settings-daemon.plugins.color night-light-schedule-from 17.0
