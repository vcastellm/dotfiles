#!/bin/bash

# Set my editor and git editor
export EDITOR=vim
export GIT_EDITOR=vim

# Don't check mail when opening terminal.
unset MAILCHECK

source ~/.dotfiles/prompt
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export TERM=xterm-color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Custom PATHS
export PATH="~/bin:~/.bin:/usr/local/bin:/usr/local/sbin:./bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export PKG_CONFIG_PATH=/usr/lib/pkgconfig/

export NODE_PATH="/usr/local/lib/node"

export GOROOT="/usr/local/go"
if [ -d "$HOME/Code" ]; then
  export GOPATH="$HOME/Code/go"
  export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
fi

if [ -d "/Applications/Postgres.app" ]; then
  export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
fi

if [ -d "/Applications/data-integration" ]; then
  export PATH="/Applications/data-integration:$PATH"
fi

# Set your credentials in this file
if [ -f "$HOME/.auth" ]; then
  source $HOME/.auth
fi

alias vim='mvim -v'
#source $HOME/Code/ansible/hacking/env-setup > /dev/null
export AWS_DEFAULT_REGION=eu-west-1

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

#source ~/Code/ansible/hacking/env-setup > /dev/null
