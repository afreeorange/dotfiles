#!/bin/bash

# Unicode!
# TODO: Weird issues on Ubuntu...
if [[ $(uname) == "Darwin" ]]; then
    export LC_ALL="en_US.UTF-8"
    export LANG="en_US.UTF-8"
fi

# Bash History
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:mount:umount:history"
export HISTSIZE=2000 # How many will be stored in memory
export HISTFILESIZE=100000 # How many will be stored on disk
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a; history -n" # Append to history immediately and not at the end of a session

# Path. Use the Homebrew path if macOS. Note: the /opt/homebrew path might just
# be an Apple Silicon thing...
export PATH="$HOME/.cargo/bin:$HOME/.bin:$HOME/.local/bin:$PATH"
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

# Homebrew
if [[ $(uname) == "Darwin" ]]; then
    export HOMEBREW_NO_ENV_HINTS=1
fi

