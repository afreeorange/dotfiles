#!/bin/bash

CLOUD_FOLDER="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

alias e="\$EDITOR"
alias ep="\$EDITOR \$HOME/.config/bash/conf.d/"
alias isodate='date "+%Y-%m-%dT%H.%M.%S"'
alias ll="ls -l"
alias please="sudo"
alias udl="yadm ls-tree --full-tree -r --name-only master"
alias venv_clean="pip uninstall -y \$(pip freeze | cut -d= -f1)"
alias life="code \$HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Life.md"
alias scratch="code \$HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Scratchpad.md"
alias lo="cd \$HOME/Programming/log; yarn new"
alias clo="cd \$HOME/Programming/log"
alias wik="cd \$HOME/Programming/wiki.nikhil.io.articles"
alias wiki="cd \$HOME/Programming/wiki.nikhil.io.articles"
if [[ $(uname) == "Darwin" ]]; then
    alias dotfiles-show="defaults write com.apple.Finder AppleShowAllFiles true && killall Finder"
    alias dotfiles-hide="defaults write com.apple.Finder AppleShowAllFiles false && killall Finder"
fi
alias note="worklog"
alias vnc_tunnel="ssh -p 3689 -L 5901:127.0.0.1:5901 -N -f -l nikhil 10.212.8.10"
alias ora="ssh nikhil@10.212.8.10 -p 3689"
alias p="pnpm"
alias y="yadm"
alias dt="deno task"

# Locations
alias co="cd \$HOME/code"
alias des="cd \$HOME/Desktop"
alias doc="cd \$HOME/Documents"
alias dow="cd \$HOME/Downloads"
alias per="cd \$HOME/Programming"
alias mus="cd \$HOME/Music"
alias pic="cd \$HOME/Pictures"
alias pro="cd \$HOME/Projects"
dro() { cd "$CLOUD_FOLDER" || exit; } # Aliases do not directly support parameter expansion like variables do.

# Remote Locations - See local bash aliases lol

# Moving around
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Docker
alias dkill="docker kill \$(docker ps -aq)"
alias drm="docker rm -f \$(docker ps -aq)"
alias drmi="docker rmi -f \$(docker images -q)"

# Git
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gp="git pull origin \$(git branch --show-current)"
alias gl="git log --oneline --abbrev-commit --all --graph --decorate --color"
alias grm="git rm \$(git ls-files --deleted)"
alias gpt="git push origin \$(git branch --show-current) --tags"
alias gpb="git push origin \$(git branch --show-current)"
alias gpom="git pull origin master"
alias grao="git remote add origin"
alias grv="git remote -v"

# Miscellaneous
if [[ $(uname) == "Darwin" ]]; then
    # Because a company worth more than a trillion dollars cannot be arsed
    # to fix this shit. Have to do this since Expose and hot screen corners
    # just suddenly decide to stop working.
    alias kd="killall Dock"

    # Brew
    alias bru="brew cleanup && brew update && brew upgrade"

    # I use this a lot
    alias o="open"
fi

# Enterprise Engine white noise generator :D Need "sox" on OS X
# http://goo.gl/x1Ow6k
alias engage="play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25 fade h 1 864000 1"
