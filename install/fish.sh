#!/bin/bash
sudo apt install fish
/usr/bin/fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
/usr/bin/fish -c "fisher install decors/fish-ghq"
