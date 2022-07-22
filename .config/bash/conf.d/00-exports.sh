#!/bin/bash

# Unicode!
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Bash History
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=100000
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND='history -a; history -n'

# Some scripts I may have in $HOME
export PATH="$HOME/.bin:$HOME/.local/bin:$PATH"

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

# macOS
export BASH_SILENCE_DEPRECATION_WARNING=1
