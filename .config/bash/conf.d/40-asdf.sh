#!/bin/bash

if [[ $(uname -s) == "Darwin" ]]; then
    # shellcheck source=/dev/null
    source "$(brew --prefix asdf)/libexec/asdf.sh"

    # shellcheck source=/dev/null
    source "$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash"

elif [[ $(uname -s) == "Linux" ]]; then
    # shellcheck source=/dev/null
    source "$HOME/.asdf/asdf.sh"

    # shellcheck source=/dev/null
    source "$HOME/.asdf/completions/asdf.bash"

fi

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
