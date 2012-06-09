#!/bin/bash

dotfiles=$(dirname $0)
for f in $dotfiles/*rc; do
  ln -v -s $f $HOME/.$(basename $f)
done
