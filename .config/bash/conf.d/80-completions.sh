#!/bin/bash

# Running this makes the startup of a session slow :( So only run this when
# completions are needed.
#
# EXCEPT fzf. fzf is cool.

# shellcheck source=/dev/null
if [[ $(uname) == "Darwin" ]]; then
    [[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
    [[ -f ~/.fzf.git.bash ]] && source ~/.fzf.git.bash
fi

# shellcheck source=/dev/null
if [[ $(uname) == "Linux" ]]; then
    [[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && source /usr/share/doc/fzf/examples/key-bindings.bash
fi

function _complete() {
    if [[ $(uname) == "Darwin" ]]; then
        # Contains completions that are installed by a package.
        # shellcheck source=/dev/null
        source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
        BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
        export BASH_COMPLETION_COMPAT_DIR
    fi

    # All my custom/manually-installed completions.
    command -v complete >>/dev/null 2>&1 && {
        for COMPLETION in "$BASHRC_D"/completions/*; do
            if  [[ $COMPLETION != *"asdf"* ]]; then
                # echo "$GRAY""Sourcing $COMPLETION""$STOP"
                # shellcheck source=/dev/null
                source "$COMPLETION" >>/dev/null 2>&1
            fi
        done

        command -v aws_completer >/dev/null 2>&1 && complete -C aws_completer aws
        command -v terraform >/dev/null 2>&1 && complete -C terraform terraform
    }
}

alias _c=_complete
_c
