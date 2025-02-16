#!/bin/bash

export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

_asdf-setup() {
  ASDF_PLUGINS=$(cut -d" " -f1 < ~/.tool-versions | sort);
  for PLUGIN in $ASDF_PLUGINS; do
      echo "Adding $PLUGIN"
      asdf plugin add "$PLUGIN"
  done

  echo "Installing stuff"
  pushd "$HOME" || exit
  asdf install
  popd || exit
}

