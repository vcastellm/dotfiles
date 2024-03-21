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
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:./bin:$PATH"

export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME"
export PATH="$GOPATH/bin:$PATH"

if [ -d "/Applications/Postgres.app" ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# Set your credentials in this file
if [ -f "$HOME/.auth" ]; then
  source $HOME/.auth
fi
export TF_VAR_github_api_token=$VAULT_GITHUB_API_TOKEN

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -e "/usr/local/bin/direnv" ]; then
  eval "$(direnv hook bash)"
fi

# SSH_AUTH_SOCK is autoexported in the previous eval (if enable-ssh-support option is present)
export GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent:66568:1
export GPG_TTY=$(tty)

if [ -d "/Applications/Visual Studio Code.app" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

alias yaegi='rlwrap yaegi'
alias flamegraph='~/src/github.com/brendangregg/FlameGraph/flamegraph.pl'

eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

#AWSume alias to source the AWSume script
alias awsume="source awsume"

#Auto-Complete function for AWSume
_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsume-autocomplete)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume

export PATH="$PATH:/Users/vcastellm/.foundry/bin"

