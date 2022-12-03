#!/bin/bash

BASHRC_D=$HOME/.config/bash

# shellcheck source=/dev/null
[[ -r "$BASHRC_D/bootstrap" ]] && source "$BASHRC_D/bootstrap"


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/nikhil/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/nikhil/miniforge3/etc/profile.d/conda.sh" ]; then
#        . "/Users/nikhil/miniforge3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/nikhil/miniforge3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#
