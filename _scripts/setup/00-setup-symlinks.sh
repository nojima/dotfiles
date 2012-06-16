#!/bin/bash

set -e

dotfiles=$HOME/dotfiles
targets=$dotfiles/[!_]*

for f in $targets; do
  ln -v -s $(readlink -f $f) $HOME/.$(basename $f)
done
