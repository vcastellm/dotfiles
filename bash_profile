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
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export TERM=screen-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Custom PATHS
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:./bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export PKG_CONFIG_PATH=/usr/lib/pkgconfig/

export GOPATH="$HOME"
export GO15VENDOREXPERIMENT=1
export PATH="$GOROOT/bin::$PATH"

if [ -d "/Applications/Postgres.app" ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
fi

if [ -d "/Applications/data-integration" ]; then
  export PATH="/Applications/data-integration:$PATH"
fi

# Set your credentials in this file
if [ -f "$HOME/.auth" ]; then
  source $HOME/.auth
fi

#source $HOME/Code/ansible/hacking/env-setup > /dev/null
export AWS_DEFAULT_REGION=eu-west-1
export EC2_REGION=$AWS_DEFAULT_REGION
export EC2_INI_PATH=ec2.ini

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -e "/usr/local/bin/direnv" ]; then
  eval "$(direnv hook bash)"
fi

export DOCKER_CERT_PATH=/Users/victorcoder/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
alias vim=nvim
