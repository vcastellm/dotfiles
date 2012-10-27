#!/bin/bash

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_THEME='envy'

# Set my editor and git editor
export EDITOR="/usr/bin/subl -w"
export GIT_EDITOR='/usr/bin/subl -w'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Path to the bash it configuration
export BASH=$HOME/.bash_it
# Load Bash It
source $BASH/bash_it.sh

# Custom PATHS
export PATH="~/bin:~/.bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

PKG_CONFIG_PATH=/usr/lib/pkgconfig/
export PKG_CONFIG_PATH

export NODE_PATH="/usr/local/lib/node"

export GOROOT="/usr/local/go"
export GOPATH="$HOME/Code/go"

export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
