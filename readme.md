## Dotfiles  

This repo will eventually contain a collection of dotfiles used to configurate my environment tools, help maintain them and make them portable.  
Clone this repo into $HOME/dotfiles

### What it does
- install apt packages  
- install programs via curl or wget  
- sets vim up  
- configure the desktop  
- creates symbolik links from dotfiles folder to $HOME folder

### Ubuntu 20.4 installation
run `./setup.sh` in scripts/

alternatively, you can run all those scripts in the following order:

- `./apt-install.sh`
- `./install-programs.sh`
- `./setup-vim.sh`
- `./ubuntu-configure-desktop.sh`
- `./symlink.sh`

When you have chosen the appropriate gnome-terminal profile, you can run  
- `./ubuntu-configure-term-profile.sh`
