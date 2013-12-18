# dotfiles

自分用設定ファイル

## Setup

```sh
# Setup Vim
$ mkdir ~/.vim_backup
$ vim +NeoBundleInstall +qa
$ cd ~/.vim/bundle/vimproc
$ make

# Setup Ruby
$ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
$ mkdir -p ~/.rbenv/plugins
$ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
$ sudo apt-get build-dep ruby2.0
$ rbenv install -l
$ rbenv install 2.0.0-pXXX
$ rbenv global 2.0.0-pXXX
$ rbenv rehash
```
