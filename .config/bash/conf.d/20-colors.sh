#!/bin/bash

# Color Reference
# https://unix.stackexchange.com/a/269085
#
# See all of them with
# for c in $(seq 0 255); do echo $(tput setaf $c)"$c" $STOP; done
#
# https://gist.github.com/janmoesen/1156154#file-bash_profile-L16

BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
FADED_PURPLE=$(tput setaf 128)
GRAY=$(tput setaf 8)
GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 16)
PURPLE=$(tput setaf 5)
RED=$(tput setaf 1)
WHITE=$(tput setaf 7)
YELLOW=$(tput setaf 3)
STOP=$(tput sgr0)

# I don't use this anymore.
# https://github.com/robbyrussell/oh-my-zsh/issues/4404#issuecomment-143728489
if [[ $(uname) == "FreeBSD" ]]; then
    BLUE=$(tput AF 4)
    CYAN=$(tput AF 6)
    FADED_PURPLE=$(tput AF 128)
    GRAY=$(tput AF 8)
    GREEN=$(tput AF 2)
    ORANGE=$(tput AF 16)
    PURPLE=$(tput AF 5)
    RED=$(tput AF 1)
    WHITE=$(tput AF 7)
    YELLOW=$(tput AF 3)
    STOP=$WHITE
fi

export BLUE
export CYAN
export FADED_PURPLE
export GRAY
export GREEN
export ORANGE
export PURPLE
export RED
export WHITE
export YELLOW
export STOP

# -----------------------------------------------------------------------------

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
    #base16_ayu-dark
    base16_gruvbox-dark-hard
    #base16_tokyodark
    #base16_tokyo-night-storm

    # The generic colorizer
    # https://github.com/garabik/grc
    if [[ $(uname) == "Darwin" ]]; then
        export GRC_ALIASES="true"
        source_if_exists "$(brew --prefix)/etc/grc.sh"
    fi
fi
