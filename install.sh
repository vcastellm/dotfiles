#! /bin/bash
dotfiles=$HOME/.dotfiles
bash_profile=$dotfiles/bash_profile
zshenv=$dotfiles/zshenv
zprofile=$dotfiles/zprofile
vimrc=$dotfiles/vimrc
irbrc=$dotfiles/irbrc
gemrc=$dotfiles/gemrc
vimfiles=$dotfiles/vimfiles
tmux_conf=$dotfiles/tmux.conf
gitignore=$dotfiles/gitignore
bin=$dotfiles/bin
ctags=$dotfiles/ctags
editorconfig=$dotfiles/editorconfig
git_prompt=$dotfiles/git-prompt.sh

[[ ! -e $HOME/.bash_profile ]] && ln -s $bash_profile $HOME/.bash_profile \
  || echo ".bash_profile already exists..."

[[ ! -e $HOME/.zshenv ]] && ln -s $zshenv $HOME/.zshenv \
  || echo ".zshenv already exists..."

[[ ! -e $HOME/.zprofile ]] && ln -s $zprofile $HOME/.zprofile \
  || echo ".zprofile already exists..."

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

[[ ! -e $HOME/.gitconfig ]] && ruby -rerb -e "File.open('../.gitconfig', 'w') { |file| file.write(ERB.new(File.read('gitconfig.erb')).result) }" \
  || echo "gitconfig already exists..."

[[ ! -e $HOME/ctags ]] && ln -s $ctags $HOME/.ctags \
  || echo "ctags already exists..."

[[ ! -e $HOME/.editorconfig ]] && ln -s $editorconfig $HOME/.editorconfig \
  || echo ".editorconfig already exists..."

[[ ! -e $HOME/.git-prompt.sh ]] && ln -s $git_prompr $HOME/.git-prompt.sh \
  || echo ".git-prompt already exists..."

echo "Done"
