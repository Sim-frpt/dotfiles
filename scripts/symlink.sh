#! /bin/bash

# Shamelessly stolen from https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/symlink.sh

dotfiles_dir="${HOME}/dotfiles"

function link_dotfile {
  file_to_link=$1
  destination="${HOME}/${2}"
  dateStr=$(date +%Y-%m-%d-%H:%M)

  if [ -h "${destination}" ]; then
    # Existing symlink
    echo "Removing existing symlink: ${destination}"
    rm ${destination}

  elif [ -f "${destination}" ]; then
    # Existing file
    echo "Backing up existing file: ${destination}"
    mv ${destination} ${destination}-${dateStr}

  elif [ -d "${destination}" ]; then
    # Existing dir
    echo "backing up existing dir: ${destination}"
    mv ${destination} ${destination}-${dateStr}
  fi

  echo "Creating new symlink: ${destination}"
  ln -s ${dotfiles_dir}${file_to_link} ${destination}
}

link_dotfile /bash/.bashrc .bashrc
link_dotfile /git/.gitconfig .gitconfig
link_dotfile /prettier/.prettierrc .prettierrc
link_dotfile /tmux .tmux
link_dotfile /tmux/.tmux.conf .tmux.conf
link_dotfile /vim .vim
link_dotfile /vim/.vimrc .vimrc
link_dotfile /vim/.vimrc_coc_config .vimrc_coc_config
link_dotfile /vscode/keybindings.json .config/Code/User/keybindings.json
link_dotfile /vscode/settings.json .config/Code/User/settings.json
link_dotfile /zsh/.zshrc .zshrc
