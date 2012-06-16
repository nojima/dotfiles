#!/bin/bash

set -e
vim +NeoBundleInstall +qa
cd ~/.vim/bundle/vimproc
make -f make_unix.mak
