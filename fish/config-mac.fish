# env
set -x LANG ja_JP.UTF-8
set -x EDITOR vim

set -x PATH $PATH /opt/homebrew/bin
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/go/bin/ $PATH
set -x PATH /usr/local/opt/openjdk/bin $PATH
 
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH:$ANDROID_HOME/emulator
set -x PATH $PATH:$ANDROID_HOME/tools
set -x PATH $PATH:$ANDROID_HOME/tools/bin
set -x PATH $PATH:$ANDROID_HOME/platform-tools
alias emulator=$HOME/Library/Android/sdk/emulator/emulator

# alias
alias v='vi'
alias vi='vim'
# alias vim='nvim'

alias asdf='/opt/homebrew/Cellar/asdf/0.11.1/libexec/bin/asdf'
source /opt/homebrew/opt/asdf/libexec/asdf.fish
