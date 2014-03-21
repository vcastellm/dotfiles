#! /bin/bash
dotfiles=$HOME/.dotfiles
bash_profile=$dotfiles/bash_profile
vimrc=$dotfiles/vimrc
irbrc=$dotfiles/irbrc
gemrc=$dotfiles/gemrc
vimfiles=$dotfiles/vimfiles
tmux_conf=$dotfiles/tmux.conf
gitignore=$dotfiles/gitignore
bin=$dotfiles/bin

[[ ! -e $HOME/.vimrc ]] && ln -s $vimrc $HOME/.vimrc \
  || echo ".vimrc already exists..."

[[ ! -e $HOME/.tmux.conf ]] && ln -s $tmux_conf $HOME/.tmux.conf \
  || echo ".tmux.conf already exists..."

[[ ! -e $HOME/.irbrc ]] && ln -s $irbrc $HOME/.irbrc \
  || echo ".irbrc already exists..."

[[ ! -e $HOME/.gemrc ]] && ln -s $gemrc $HOME/.gemrc \
  || echo ".gemrc already exists..."

[[ ! -e $HOME/.gitignore ]] && ln -s $gitignore $HOME/.gitignore \
  || echo ".gitignore already exists..."

[[ ! -e $HOME/bin ]] && ln -s $bin $HOME/bin \
  || echo "bin already exists..."

echo "Done"
