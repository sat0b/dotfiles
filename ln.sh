#!/bin/bash

# tmux
ln -sf "$(pwd)/tmux.conf" "$HOME/.tmux.conf"

# vim
ln -sf "$(pwd)/vimrc" "$HOME/.vimrc"
mkdir -p ~/.vim/backup ~/.vim/undo

# fish
ln -sf "$(pwd)/config.fish" "$HOME/.config/fish/config.fish"

# nvim
mkdir -p ~/.config/nvim/
ln -sf $(pwd)/vimrc ~/.config/nvim/init.vim

# git
ln -sf $(pwd)/.gitconfig ~/.gitconfig

