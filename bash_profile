#!/bin/bash

if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# Set my editor and git editor
export EDITOR=vim
export GIT_EDITOR=vim

# Don't check mail when opening terminal.
unset MAILCHECK

source ~/.dotfiles/prompt

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export TERM=screen-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Custom PATHS
export PATH="/bin:~/bin:/usr/local/bin:/usr/local/sbin:./bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME"
export PATH="$GOPATH/bin:$PATH"

if [ -d "/Applications/Postgres.app" ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# Set your credentials in this file
if [ -f "$HOME/.auth" ]; then
  source $HOME/.auth
fi

if [ -e "/usr/local/bin/direnv" ]; then
  eval "$(direnv hook bash)"
fi

if [ -d "/Applications/Visual Studio Code.app" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

alias flamegraph='~/src/github.com/brendangregg/FlameGraph/flamegraph.pl'

eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

export PATH="$PATH:/home/vcastellm/.foundry/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
