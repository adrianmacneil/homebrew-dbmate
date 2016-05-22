#!/bin/bash -e

if [ -z "$(brew info dbmate | grep -i 'not installed')" ]; then
  (set -x; brew uninstall dbmate)
fi

set -x
rm -f *.bottle.tar.gz
brew install --build-bottle dbmate
brew bottle dbmate
