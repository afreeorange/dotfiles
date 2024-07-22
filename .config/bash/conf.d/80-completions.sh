#!/bin/bash

# Running this makes the startup of a session slow :( So only run this when
# completions are needed.
#
# EXCEPT fzf. fzf is cool.

# shellcheck source=/dev/null
if [[ $(uname) == "Darwin" ]]; then
    [[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
fi

# shellcheck source=/dev/null
if [[ $(uname) == "Linux" ]]; then
    [[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && source /usr/share/doc/fzf/examples/key-bindings.bash
fi

function _complete() {
    if [[ $(uname) == "Darwin" ]]; then
        # shellcheck source=/dev/null
        source "$(brew --prefix)/etc/bash_completion"
    fi

    command -v complete >>/dev/null 2>&1 && {
        for COMPLETION in "$BASHRC_D"/completions/*; do
            echo "$GRAY""Sourcing $COMPLETION""$STOP"
            # shellcheck source=/dev/null
            source "$COMPLETION" >>/dev/null 2>&1
        done

        command -v aws_completer >/dev/null 2>&1 && complete -C aws_completer aws
        command -v terraform >/dev/null 2>&1 && complete -C terraform terraform
    }

    # pnpm
    [[ -f ~/.config/tabtab/bash/__tabtab.bash ]] && . ~/.config/tabtab/bash/__tabtab.bash || true

    # Pipx is special
    command -v pipx >>/dev/null 2>&1 && {
        eval "$(register-python-argcomplete pipx)"
    }
}

alias _c=_complete
