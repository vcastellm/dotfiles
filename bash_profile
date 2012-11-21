#!/bin/bash

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_THEME='envy'

# Set my editor and git editor
export EDITOR="/usr/bin/subl -w"
export GIT_EDITOR='/usr/bin/subl -w'

# Don't check mail when opening terminal.
unset MAILCHECK

# Path to the bash it configuration
export BASH=$HOME/.bash_it
# Load Bash It
source $BASH/bash_it.sh

export TERM=xterm-256color
export LANG=en_EN.UTF-8
export LC_ALL=en_US.UTF-8

# Custom PATHS
export PATH="~/bin:~/.bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

PKG_CONFIG_PATH=/usr/lib/pkgconfig/
export PKG_CONFIG_PATH

export NODE_PATH="/usr/local/lib/node"

export GOROOT="/usr/local/go"
export GOPATH="$HOME/Code/go"

export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
