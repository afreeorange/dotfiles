#!/bin/bash

BASHRC_D=$HOME/.config/bash

# shellcheck source=/dev/null
[[ -r "$BASHRC_D/bootstrap" ]] && source "$BASHRC_D/bootstrap"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
