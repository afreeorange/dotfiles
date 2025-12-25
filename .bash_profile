#!/bin/bash

BASHRC_D=$HOME/.config/bash

# shellcheck source=/dev/null
[[ -r "$BASHRC_D/bootstrap" ]] && source "$BASHRC_D/bootstrap"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

. "$HOME/.atuin/bin/env"
