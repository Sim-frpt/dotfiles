## Dotfiles  

This repo will eventually contain a collection of dotfiles used to configurate my environment tools, help maintain them and make them portable.  
Clone this repo into $HOME/dotfiles
### What it does
- configure the desktop  
- install apt packages  
- install programs via curl or wget  
- sets vim up  
- creates symbolik links from dotfiles folder to $HOME folder
### Ubuntu 20.4 installation
run `./setup.sh` in scripts/

alternatively, you can run in this order:

- `./ubuntu-configure-desktop.sh`
- `./apt-install.sh`
- `./install-programs.sh`
- `./setup-vim.sh`
- `./symlink.sh`

When you have chosen the appropriate gnome-terminal profile, you can run  
`./ubuntu-configure-term-profile.sh`
