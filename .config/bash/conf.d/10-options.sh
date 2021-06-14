#!/bin/bash

shopt -s cmdhist      # For history; force commands to fit on one line
shopt -s histappend   # Append to history instead of overwriting
shopt -s nocaseglob   # Case-insensitive globbing
shopt -s cdspell      # Autocorrect typos in path names when using `cd`
shopt -s checkwinsize # Update LINES and COLUMNS on screen resize
