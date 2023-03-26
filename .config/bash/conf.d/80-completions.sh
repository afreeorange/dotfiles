#!/bin/bash

# Running this makes the startup of a session slow :( So only run this when
# completions are needed.
#
# EXCEPT fzf. fzf is cool.

# shellcheck source=/dev/null
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

function _complete() {
    if [[ $(uname) == "Darwin" ]]; then
        # shellcheck source=/dev/null
        source "$(brew --prefix)/etc/bash_completion"
    fi

    command -v complete >>/dev/null 2>&1 && {
        for COMPLETION in "$BASHRC_D"/completions/*; do
            # shellcheck source=/dev/null
            source "$COMPLETION"
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
