#!/bin/bash

BASHRC_D=$HOME/.config/bash

# shellcheck source=/dev/null
[[ -r "$BASHRC_D/bootstrap" ]] && source "$BASHRC_D/bootstrap"

if [ -e /Users/nikhilanand/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/nikhilanand/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
