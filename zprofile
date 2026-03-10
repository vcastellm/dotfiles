# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

export PATH=~/bin:~/.brew/bin:/Users/victor/.brew/bin:/Users/victor/.brew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/Users/victor/.foundry/bin"

autoload -Uz compinit && compinit

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(oh-my-posh init zsh)"

export GOPATH="/Users/victor"
export GOROOT="/opt/homebrew/Cellar/go/1.21.3/libexec"

if [ -d "/Applications/Visual Studio Code.app" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi
