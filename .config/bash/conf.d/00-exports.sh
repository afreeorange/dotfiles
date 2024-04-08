#!/bin/bash

# Unicode!
# TODO: Weird issues on Ubuntu...
if [[ $(uname) == "Darwin" ]]; then
    export LC_ALL="en_US.UTF-8"
    export LANG="en_US.UTF-8"
fi

# Bash History
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:bg:fg:history"
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a; history -n"

# Path. Use the Homebrew path if macOS. Note: the /opt/homebrew path might just
# be an Apple Silicon thing...
export PATH="$HOME/.bin:$HOME/.local/bin:$PATH"
if [[ $(uname) == "Darwin" ]] && [[ "$(uname -m)" == "arm64" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# Some scripts I may have in $HOME
export PATH=":$PATH"

# FZF configuration
export FZF_DEFAULT_COMMAND="fd \
   --type f \
   --hidden \
   --follow \
   --exclude .git \
   --exclude .nvm \
   --exclude node_modules"
export FZF_DEFAULT_OPTS="--ansi"

# AWS Stuff
export AWS_PROFILE="nikhil.io"
export AWS_DEFAULT_REGION="us-east-1"
