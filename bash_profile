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

#gpg-agent Pretty good changelog https://www.gnupg.org/faq/whats-new-in-2.1.html
#This step is not necesary, but due to the outdated state of gpg libs in vautl-tec, we need to be sure that the agent is running
eval `gpg-agent --daemon 2>/dev/null`
# SSH_AUTH_SOCK is autoexported in the previous eval (if enable-ssh-support option is present)
export GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent:66568:1
export GPG_TTY=$(tty)

if [ -d "/Applications/Visual Studio Code.app" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

alias yaegi='rlwrap yaegi'
alias flamegraph='~/src/github.com/brendangregg/FlameGraph/flamegraph.pl'

export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:$PATH"
export PATH="/Users/victorcoder/.local/share/solana/install/active_release/bin:$PATH"
if [[ -x /usr/local/bin/monk ]]; then complete -C /usr/local/bin/monk monk; fi
eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"
if [[ -x /opt/homebrew/bin/monk ]]; then complete -C /opt/homebrew/bin/monk monk; fi

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vcastellm/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/vcastellm/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vcastellm/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/vcastellm/Downloads/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/opt/homebrew/opt/go@1.18/bin:$PATH"
export PATH="$PATH:/Users/vcastellm/.foundry/bin"


