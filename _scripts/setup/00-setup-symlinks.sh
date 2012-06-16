#!/bin/bash

set -e
shopt -s extglob
for f in $HOME/dotfiles/!(_*|README.md); do
  ln -v -s $(readlink -f $f) $HOME/.$(basename $f)
done
