#!/bin/bash

# Install Neovim configuration
ln -s $PWD/nvim ~/.config/

# Install Tmux configuration
rm ~/.tmux.conf
ln -s $PWD/tmux/.tmux.conf ~/

# Install i3 configuration
rm -rf ~/.i3
ln -s $PWD/i3/.i3 ~/.i3

# Install emacs configuration
ln -s $PWD/emacs/.emacs.d ~/

# Install Vscode configuration
rm ~/.config/Code/User/settings.json
ln -s $PWD/vscode/settings.json ~/.config/Code/User/

# Install bashrc and aliases
rm ~/.bashrc
rm ~/.bash_aliases
ln -s $PWD/bash/.bashrc ~/
ln -s $PWD/bash/.bash_aliases ~/
