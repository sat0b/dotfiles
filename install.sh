#!/bin/bash

for file in $(ls -a | grep "^\.\w"); do
    [[ "$file" == ".git" ]] && continue
    ln -sf "$(pwd)/$file" "$HOME/$file"
done

# vim
mkdir -p ~/.vim/backup ~/.vim/undo

mkdir -p ~/.config/fish/
ln -s $(pwd)/config.fish ~/.config/fish/config.fish
