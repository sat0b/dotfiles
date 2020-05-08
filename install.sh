#!/bin/bash

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           -s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

