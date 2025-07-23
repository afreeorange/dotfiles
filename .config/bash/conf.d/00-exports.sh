#!/bin/bash

# Unicode!
# TODO: Weird issues on Ubuntu...
if [[ $(uname) == "Darwin" ]]; then
    export LC_ALL="en_US.UTF-8"
    export LANG="en_US.UTF-8"
fi

## 1. Store 100,000 commands in history
#HISTSIZE=100000
#HISTFILESIZE=100000
#
## 2. Erase subsequent duplicate commands in history (do not store duplicates next to each other)
#HISTCONTROL=erasedups:ignoredups
#
## 3. Ignore specific commands in history (ls, bg, fg, history, pwd, clear)
#HISTIGNORE="ls:bg:fg:history:pwd:clear"
#
## 4. Append to the history file, don’t overwrite it
#shopt -s histappend
#
## 5. Immediately sync history between sessions
#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Bash History
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=erasedups:ignoredups
export HISTIGNORE="ls:bg:fg:history:pwd:clear:exit"
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#export HISTIGNORE="&:ls:[bf]g:exit:pwd:clear:mount:umount:history"
#export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND" # Append to history immediately and not at the end of a session

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
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

