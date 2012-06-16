#!/bin/bash

set -e

dotfiles=$(dirname $0)/../
targets=$dotfiles/*rc $dotfiles/vim

for f in $targets; do
  ln -v -s $(readlink -f $f) $HOME/.$(basename $f)
done
