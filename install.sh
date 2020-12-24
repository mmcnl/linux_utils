#!/bin/bash

mkdir -p "$HOME/bin/"

for f in *
do
  # don't create links to non-binaries or directories
  test -d "$f" && continue
  test -x "$f" || continue

  # don't link to this script
  [[ "$f" == 'install.sh' ]] && continue

  # skip if link already exists
  [[ -L "$HOME/bin/$f" ]] && continue

  # create link in $HOME/bin
  ln -sv "$(pwd)/$f" ~/bin/
done