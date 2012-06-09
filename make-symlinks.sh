#!/bin/bash

dotfiles=$(readlink -f $(dirname $0))
for f in $dotfiles/*rc; do
  ln -v -s $f $HOME/.$(basename $f)
done
