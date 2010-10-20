# set a fancy prompt (non-color, unless we know we "want" color)
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
PKG_CONFIG_PATH=/usr/lib/pkgconfig/
export PKG_CONFIG_PATH

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
