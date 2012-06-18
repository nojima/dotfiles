#!/bin/bash

set -e
mkdir ~/.vim_backup
vim +NeoBundleInstall +qa
cd ~/.vim/bundle/vimproc
make -f make_unix.mak
