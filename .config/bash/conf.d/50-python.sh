#!/bin/bash

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(pyenv init --path)"
eval "$(pyenv init -)"

if which pyenv-virtualenv-init >> /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi
