#!/bin/bash

. "$(pwd)/utils.sh"

echo "####################"
echo "install gruvbox-dark profile"
echo "####################"


# Download gnome-terminal theme
mkdir -p "${HOME}/src"
cd "${HOME}/src"
git clone https://github.com/Mayccoll/Gogh.git gogh
cd gogh/themes

# necessary on ubuntu
export TERMINAL=gnome-terminal

# Ask the user to create a new profile named 'Default', or the gogh script won't work. see https://github.com/Mayccoll/Gogh/issues/203
continue=false

while [ $continue = false ]; do
  read  -p "Please create a new gnome-terminal profile with the 'Default' name (menu -> preferences -> Profiles +), then press \"y\" to continue `echo $'\n> '`" should_continue

  echo $should_continue;
  if [ $should_continue == "y" ]; then
    continue=true
  fi
done

# install theme
./gruvbox-dark.sh


rm -rf "${HOME}/src"

# Programmatically setting the profile as default is apparently impossible, have to ask the user to do it
continue=false

while [ $continue = false ]; do
  read -p "Please select the gruvbox-dark profile to configure as default profile (menu -> preferences -> Gruvbox Dark -> set as default) then press \"y\" to continue `echo $'\n> '`" should_continue

  echo $should_continue;
  if [ $should_continue == "y" ]; then
    continue=true
  fi
done

gruvbox_profile=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
font="Cascadia Code 13"

change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gruvbox_profile/ audible-bell false
change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gruvbox_profile/ cursor-shape 'block'
change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gruvbox_profile/ default-size-columns 80
change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gruvbox_profile/ use-system-font false
change_setting org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gruvbox_profile/ font "$font"

# Change terminal keybindings
dconf write /org/gnome/terminal/legacy/keybindings/prev-tab "'<Primary>Left'"
dconf write /org/gnome/terminal/legacy/keybindings/next-tab "'<Primary>Right'"
dconf write /org/gnome/terminal/legacy/keybindings/move-tab-left "'<Primary><Shift>Left'"
dconf write /org/gnome/terminal/legacy/keybindings/move-tab-right "'<Primary><Shift>Right'"

echo "Your profile has been set correctly, you can now delete the 'Default' profile"
