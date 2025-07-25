#!/bin/bash

if ! command -v mise &>/dev/null; then
    echo "⚠️ You haven't installed mise"
else
    eval "$(mise activate bash)"
fi
