#!/bin/bash

set -e
for f in $(echo $HOME/dotfiles/_scripts/setup/* | sort); do
  echo $f
  $f
done
