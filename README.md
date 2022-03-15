# dotfiles

自分用設定ファイル

## Setup

```sh
git clone https://github.com/nojima/dotfiles.git ~/dotfiles

# Make symlink
cd
for f in .vimrc .zshrc .tmux.conf .gitconfig .gitignore .pylintrc; do
    ln -s dotfiles/$f $f
done

# Setup Zsh
TODO

# (Re-login to start zsh)

# Setup Vim
mkdir -p ~/.vim_backup ~/.vim_undo ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qa
cd ~/.vim/bundle/vimproc; make

# Setup Ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo apt-get build-dep ruby2.0
source ~/.zshrc
rbenv install -l
rbenv install 2.x.x
rbenv global 2.x.x
rbenv rehash
```
