#!/bin/bash

if [[ $(uname) == "Darwin" ]]; then
    # shellcheck source=/dev/null
    . "$(brew --prefix asdf)/libexec/asdf.sh"

    # shellcheck source=/dev/null
    . "$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash"
fi
