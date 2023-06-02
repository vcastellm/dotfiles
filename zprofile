# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

export PATH=~/.brew/bin:/Users/victor/.brew/bin:/Users/victor/.brew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH="/opt/homebrew/opt/go@1.19/bin:$PATH"
export PATH="$PATH:/Users/victor/.foundry/bin"

autoload -Uz compinit && compinit

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(oh-my-posh init zsh)"

export GOPATH="/Users/victor"

if [ -d "/Applications/Visual Studio Code.app" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi


