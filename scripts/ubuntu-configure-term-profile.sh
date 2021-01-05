#!/bin/bash

. "$(pwd)/utils.sh"

echo "####################"
echo "install gruvbox-dark profile"
echo "####################"

# Reset default profile
dconf reset -f /org/gnome/terminal/legacy/profiles:/

default_id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

# Rename default profile from 'Unnamed' to 'Default', See https://github.com/Mayccoll/Gogh/issues/63
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$default_id/ visible-name 'Default'

# Download gnome-terminal theme
mkdir -p "${HOME}/src"
cd "${HOME}/src"
git clone https://github.com/Mayccoll/Gogh.git gogh
cd gogh/themes

# necessary on ubuntu
export TERMINAL=gnome-terminal

#profile_list=$(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]'" | sed 's/,\s/\n/')

# install theme
./gruvbox-dark.sh

rm -rf "${HOME}/src"

# Programmatically setting the profile as default is apparently impossible, have to ask the user to do it
continue=false

while [ $continue = false ]; do
  read -p "Please select the gruvbox-dark profile to configure, then press \"y\" to continue `echo $'\n> '`" should_continue

  echo $should_continue;
  if [ $should_continue == "y" ]; then
    continue=true
  fi
done

gnome_terminal_profile=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
font="Cascadia Code 13"

change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gnome_terminal_profile/ audible-bell false
change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gnome_terminal_profile/ cursor-shape 'block'
change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gnome_terminal_profile/ default-size-columns 80
change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gnome_terminal_profile/ use-system-font false

# For whatever reason I can't seem to be able to make it work with my custom 'change_setting function', something to do with the quotes around multiple-word value...
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")/ font "$font"

# Change terminal keybindings
dconf write /org/gnome/terminal/legacy/keybindings/prev-tab "'<Primary>Left'"
dconf write /org/gnome/terminal/legacy/keybindings/next-tab "'<Primary>Right'"
dconf write /org/gnome/terminal/legacy/keybindings/move-tab-left "'<Primary><Shift>Left'"
dconf write /org/gnome/terminal/legacy/keybindings/move-tab-right "'<Primary><Shift>Right'"

