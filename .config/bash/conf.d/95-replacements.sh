#!/bin/bash

# Use vim if nvim not available
VIM=vim
command -v nvim >/dev/null 2>&1 && VIM=nvim
alias vim='$VIM'
export EDITOR=$VIM
export GIT_EDITOR=$VIM
export MANPAGER="/bin/sh -c \"col -b | $VIM -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# Use ping if prettyping not available
export PINGER=ping
command -v prettyping >/dev/null 2>&1 && PINGER="prettyping --nolegend"
alias ping='$PINGER'

# For Arch, since I miss 'open' on OS X
[[ -f /etc/arch-release ]] && alias open='xdg-open'
