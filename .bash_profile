source ~/.profile
#!/bin/bash

BASHRC_D=$HOME/.config/bash

# shellcheck source=/dev/null
[[ -r "$BASHRC_D/bootstrap" ]] && source "$BASHRC_D/bootstrap"

## added by Servbay
#export PATH=/Applications/ServBay/script/alias:/Applications/ServBay/bin:/Applications/ServBay/sbin:/Applications/ServBay/script:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nikhil/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nikhil/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nikhil/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nikhil/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

