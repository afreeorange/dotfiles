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

# TODO: Colors...
draw_line() {
    local LINE_CHAR=$1
    local WIDTH

    WIDTH=$(tput cols)
    LINE=$(printf '%*s' "$WIDTH" '' | tr ' ' "$LINE_CHAR")
    echo -e "$LINE"
}

