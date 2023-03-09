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
