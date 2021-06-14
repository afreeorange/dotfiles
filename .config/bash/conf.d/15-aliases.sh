#!/bin/bash

alias co='cd $HOME/code'
alias ep='$EDITOR $HOME/.config/bash/conf.d/'
alias isodate='date "+%Y-%m-%dT%H.%M.%S"'
alias ll='ls -l'
alias please='sudo'
alias udl='yadm ls-tree --full-tree -r --name-only master'
alias venv_clean='pip uninstall -y $(pip freeze | cut -d= -f1)'
alias worklog='touch "$HOME"/Dropbox/Work/worklog-`date "+%Y-%m-%d"`.md && "$EDITOR" $HOME/Dropbox/Work/worklog-`date "+%Y-%m-%d"`.md'
alias life="sublime \$HOME/Dropbox/Life.md"
alias scratch="sublime \$HOME/Dropbox/Scratchpad.md"
alias lo='cd $HOME/log; yarn new'
if [[ $(uname) == "Darwin" ]]; then
    alias dotfiles-show="defaults write com.apple.Finder AppleShowAllFiles true && killall Finder"
    alias dotfiles-hide="defaults write com.apple.Finder AppleShowAllFiles false && killall Finder"
fi
#command -v exa > /dev/null 2>&1 && alias ls="exa" # Use exa instead of ls if present
alias dro='cd $HOM/Dropbox'
alias dow='cd $HOME/Downloads'
alias des='cd $HOME/Desktop'

# Moving around
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Brew
alias bru='brew cleanup && brew update && brew upgrade'

# Docker
alias dkill='docker kill $(docker ps -aq)'
alias drm='docker rm -f $(docker ps -aq)'
alias drmi='docker rmi -f $(docker images -q)'

# Git
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git pull origin $(git branch --show-current)'
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias grm='git rm $(git ls-files --deleted)'
alias gpt='git push origin $(git branch --show-current) --tags'
alias gpb='git push origin $(git branch --show-current)'
