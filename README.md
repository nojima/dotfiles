# dotfiles

自分用設定ファイル

## Setup

```sh
# Setup Zsh
$ git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
$ chsh -s /bin/zsh

# Setup Vim
$ mkdir -p ~/.vim_backup ~/.vim_undo ~/.vim/bundle
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ vim +NeoBundleInstall +qa
$ cd ~/.vim/bundle/vimproc; make

# Setup Ruby
$ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
$ mkdir -p ~/.rbenv/plugins
$ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
$ sudo apt-get build-dep ruby2.0
$ rbenv install -l
$ rbenv install 2.x.x
$ rbenv global 2.x.x
$ rbenv rehash
```
