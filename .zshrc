export LANG=ja_JP.UTF-8

autoload -Uz colors compinit
compinit
colors

alias ll='ls -lG'

setopt correct
setopt no_flow_control

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"


# enhancd
source ~/bin/enhancd/init.sh

# hub
eval "$(hub alias -s)"

