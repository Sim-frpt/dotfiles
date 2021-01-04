#!/bin/bash

. "$(pwd)/utils.sh"

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

