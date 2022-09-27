#!/bin/bash

source_if_exists() {
    # shellcheck source=/dev/null
    [[ -e "$1" ]] && source "$1"
}

warn() {
    echo "$RED""❕$1""$STOP"
}

trash() {
    if [[ -n "$1" ]]; then
        if ! mv "$1" ~/.Trash/"$1.$(date "+%Y-%m-%dT%H.%M.%S")"; then
            echo "Something bad happened. Does that thing you're trying to trash even exist?"
        fi
    else
        echo "What do you want me to trash?"
    fi
}
