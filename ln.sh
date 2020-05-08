#!/bin/bash

# tmux
ln -sf "$(pwd)/tmux.conf" "$HOME/.tmux.conf"

# fish
mkdir -p ~/.config/fish/
ln -sf $(pwd)/config.fish ~/.config/fish/config.fish

# vim
ln -sf "$(pwd)/vimrc" "$HOME/.vimrc"
mkdir -p ~/.vim/backup ~/.vim/undo

# nvim
mkdir -p ~/.config/nvim/
ln -sf $(pwd)/vimrc ~/.config/nvim/init.vim
ln -sf $(pwd)/vim/memolist_template/ ~/.config/nvim/

