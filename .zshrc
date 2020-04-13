export LANG=ja_JP.UTF-8

autoload -Uz colors compinit
compinit
colors

alias l='ls -G'
alias ll='ls -lG'
alias grep='grep --color'

setopt correct
setopt no_flow_control

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

# # Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# hub
eval "$(hub alias -s)"

export PATH="/usr/local/opt/python@3.8/bin:$PATH"

