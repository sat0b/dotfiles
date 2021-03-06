# env
set -x LANG ja_JP.UTF-8
set -x EDITOR vim

set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/go/bin/ $PATH
set -x PATH /usr/local/opt/openjdk/bin $PATH
set -x PATH /usr/local/opt/python@3.8/bin $PATH

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH:$ANDROID_HOME/emulator
set -x PATH $PATH:$ANDROID_HOME/tools
set -x PATH $PATH:$ANDROID_HOME/tools/bin
set -x PATH $PATH:$ANDROID_HOME/platform-tools

# alias
alias emacs='emacs -nw'
alias v='vi'
alias vi='vim'
alias vim='nvim'
alias l='ls -G'
alias ll='ls -lG'
alias grep='grep --color'
alias rm='rmtrash'

source /usr/local/opt/asdf/asdf.fish
