# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
  *) return ;;
esac

path_prepend() {
  [ -n "$1" ] && [ -d "$1" ] || return
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1${PATH:+:$PATH}" ;;
  esac
}

path_append() {
  [ -n "$1" ] && [ -d "$1" ] || return
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="${PATH:+$PATH:}$1" ;;
  esac
}

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# History length.
HISTSIZE=1000
HISTFILESIZE=2000

# Update LINES and COLUMNS after each command.
shopt -s checkwinsize

# Make less more friendly for non-text input files.
if command -v lesspipe >/dev/null 2>&1; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi

# Set variable identifying the chroot you work in.
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(< /etc/debian_chroot)
fi

# Enable color support of ls and add handy aliases.
if command -v dircolors >/dev/null 2>&1; then
  if [ -r "$HOME/.dircolors" ]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if command -v notify-send >/dev/null 2>&1; then
  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && printf terminal || printf error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=vim
export GIT_EDITOR="$EDITOR"

# Don't check mail when opening terminal.
unset MAILCHECK

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
unset LC_ALL

# Custom paths.
export GOPATH="$HOME"
export PNPM_HOME="$HOME/.local/share/pnpm"
export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"
export BATS_LIB_PATH="$HOME/.bats/libs"

path_prepend "$HOME/.opencode/bin"
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.sp1/bin"
path_prepend "$HOME/.helios/bin"
path_prepend "$HOME/.foundry/bin"
path_prepend "$PNPM_HOME"
path_prepend "$BUN_INSTALL/bin"
path_prepend "$GOPATH/bin"
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/.rbenv/bin"
path_append "$HOME/bin"
path_append "/usr/local/go/bin"
path_append "/usr/local/bin"
path_append "/usr/local/sbin"
path_prepend "$HOME/google-cloud-sdk/bin"

case "$OSTYPE" in
  darwin*)
    if [ -x "/opt/homebrew/bin/brew" ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    if [ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]; then
      . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    fi

    if [ -d "/Applications/Postgres.app" ]; then
      path_prepend "/Applications/Postgres.app/Contents/Versions/latest/bin"
    fi

    if [ -d "/Applications/Visual Studio Code.app" ]; then
      path_append "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    fi
    ;;
esac

# Set your credentials in this file.
if [ -f "$HOME/.auth" ]; then
  . "$HOME/.auth"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

alias flamegraph='$HOME/src/github.com/brendangregg/FlameGraph/flamegraph.pl'
alias zola='flatpak run org.getzola.zola'

lazy_load_nvm() {
  unset -f nvm node npm npx corepack
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

if [ -s "$NVM_DIR/nvm.sh" ]; then
  nvm() { lazy_load_nvm; nvm "$@"; }
  node() { lazy_load_nvm; node "$@"; }
  npm() { lazy_load_nvm; npm "$@"; }
  npx() { lazy_load_nvm; npx "$@"; }
  corepack() { lazy_load_nvm; corepack "$@"; }
fi

if [ -x "$HOME/.rbenv/bin/rbenv" ]; then
  eval "$("$HOME/.rbenv/bin/rbenv" init - --no-rehash bash)"
fi

if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.bash.inc"
fi

source "$HOME/.dotfiles/prompt"
