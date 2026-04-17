#!/bin/bash

source_if_exists() {
    # shellcheck source=/dev/null
    [[ -e "$1" ]] && source "$1"
}

warn() {
    echo "$RED""❕$1""$STOP"
}

dataurl() {
    MIMETYPE=$(file -b --mime-type "$1")

    if [[ $MIMETYPE == text/* ]]; then
        MIMETYPE="${MIMETYPE};charset=utf-8"
    fi

    echo "data:${MIMETYPE};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

s3_bucket_size() {
    aws s3 ls --summarize --human-readable --recursive "$1"
}

hs() {
    local WORKING_DIR
    WORKING_DIR=$(pwd)

    if [[ -n "$1" ]]; then
        WORKING_DIR=$1
    fi

    echo "Using this as root: $WORKING_DIR"
    echo "Starting server at"
    echo "http://127.0.0.1:8080"
    echo "─────────────────────────────────────────────────────────────────"

    caddy file-server \
    --access-log \
    --browse \
    --reveal-symlinks \
    --listen 127.0.0.1:8080 \
    --root "$WORKING_DIR"
}

ydlp() {
    local file
    file=$(yt-dlp --print "%(filename)s" "$@")

    echo "Downloading $file"
    yt-dlp "$@"

    echo "Converting $file"
    ffmpeg -i "$file" "OUTPUT-$file".mp4
}

# TODO: Colors...
draw_line() {
    local LINE_CHAR="${1:-=}" # Default to = if no arg provided
    local WIDTH=$(tput cols)

    printf -v LINE "%${WIDTH}s" ""
    echo "${LINE// /$LINE_CHAR}"
}

mkcd () {
    \mkdir -p "$1"
    cd "$1"
}

mksh() {
    if [ ! $# -eq 1 ]; then
        echo 'mksh takes one argument' 1>&2
        exit 1
        elif [ -e "$1" ]; then
        echo "$1 already exists" 1>&2
        exit 1
    fi

    echo '#!/bin/env bash
set -euo pipefail

    ' > "$1"

    chmod u+x "$1"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    init_conda() {
        __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [[ $? -eq 0 ]]; then
            eval "$__conda_setup"
        else
            if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
                . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
            else
                export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
            fi
        fi
        unset __conda_setup
        echo "🐍 Conda initialized."
    }
fi
