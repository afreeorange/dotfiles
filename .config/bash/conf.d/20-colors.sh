#!/bin/bash

# shellcheck source=/dev/null
source "$HOME/.bash_colors"

# Color Reference
# https://unix.stackexchange.com/a/269085
#
# See all of them with
# for c in $(seq 0 255); do echo $(tput setaf $c)"$c" $STOP; done
#
# https://gist.github.com/janmoesen/1156154#file-bash_profile-L16

# Tell ls to be colorful
export CLICOLOR=1 # This is so macOS behaves
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb

# Base16 <3 <3 <3
# https://github.com/tinted-theming/base16-shell
BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] &&
    [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] &&
    source "$BASE16_SHELL_PATH/profile_helper.sh"

# Only do this if in interactive mode. According to the bash `man` page,
# $- includes "i" if the shell is started in interactive mode.
if [[ $- == *i* ]]; then
    # Shell theme <3
    base16_gruvbox-dark-pale

    # The Generic Colorizer <3
    source_if_exists /usr/local/etc/grc.bashrc
fi
