#!/bin/bash

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Update LINES and COLUMNS on screen resize
shopt -s checkwinsize

# For history; force commands to fit on one line
shopt -s cmdhist

# Append to history instead of overwriting
shopt -s histappend

# Case-insensitive globbing
shopt -s nocaseglob
