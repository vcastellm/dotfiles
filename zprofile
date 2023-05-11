# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

export PATH=~/.brew/bin:/Users/victor/.brew/bin:/Users/victor/.brew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH="/Users/victor/.brew/opt/go@1.19/bin:$PATH"
export PATH="$PATH:/Users/victor/.foundry/bin"

autoload -Uz compinit && compinit
eval "$(oh-my-posh init zsh)"

