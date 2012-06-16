#!/bin/bash

set -e
for f in $(echo $(dirname $0)/setup/* | sort); do
  echo $f
  bash < $f
done
