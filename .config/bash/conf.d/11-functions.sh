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
