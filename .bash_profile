#!/bin/bash

BASHRC_D=$HOME/.config/bash

# shellcheck source=/dev/null
[[ -r "$BASHRC_D/bootstrap" ]] && source "$BASHRC_D/bootstrap"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

command -v atuin >/dev/null 2>&1 && eval "$(atuin init bash --disable-up-arrow)"

#eval "$(atuin init bash --disable-up-arrow)"

#. "$HOME/.atuin/bin/env"
