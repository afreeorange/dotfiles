#!/bin/bash

# --- UTILITY FUNCTIONS ---

source_if_exists() {
    # shellcheck source=/dev/null
    [[ -e "$1" ]] && source "$1"
}

warn() {
    echo "$RED""❕$1""$STOP"
}

# --- EXPORTS & BASH OPTIONS ---

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
export PATH="$HOME/.bin:$PATH"

# FZF configuration
export FZF_DEFAULT_COMMAND="fd \
    --type f \
    --hidden \
    --follow \
    --exclude .git \
    --exclude .nvm \
    --exclude node_modules
"
export FZF_DEFAULT_OPTS="\
    --ansi
"

# Shell options
shopt -s cmdhist      # For history; force commands to fit on one line
shopt -s histappend   # Append to history instead of overwriting
shopt -s nocaseglob   # Case-insensitive globbing
shopt -s cdspell      # Autocorrect typos in path names when using `cd`
shopt -s checkwinsize # Update LINES and COLUMNS on screen resize

# macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# --- COLORS ---

export CLICOLOR=1

# Colors
# shellcheck source=/dev/null
source "$HOME/.bash_colors"

# The Generic Colorizer <3
source_if_exists /usr/local/etc/grc.bashrc

# fzf
source_if_exists "$HOME/.fzf.bash"

# Tell ls to be colorful
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb

# Base16 <3 <3 <3
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_gruvbox-dark-pale

# --- LANGUAGE CONFIGS ---

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="$HOME/.poetry/bin:$PATH"
command -v pyenv > /dev/null 2>&1 && eval "$(pyenv init -)"

# Node
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# GO!
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# --- COMPLETIONS ---

if [[ $(uname) == "Darwin" ]]; then
    # shellcheck source=/dev/null
    source "$(brew --prefix)/etc/bash_completion"
fi

command -v complete >> /dev/null 2>&1 && {
    for COMPLETION in "$HOME"/.completions/*; do
        # shellcheck source=/dev/null
        source "$COMPLETION"
    done

    command -v aws_completer > /dev/null 2>&1 && complete -C aws_completer aws
    command -v terraform > /dev/null 2>&1 && complete -C terraform terraform
}

# --- PROMPT CUSTOMIZATION <3 ---

# Why not?
if [[ -z "$PS_SYMBOL" ]]; then
  case "$(uname)" in
      Darwin  ) PS_SYMBOL='';;
      Linux   ) PS_SYMBOL='🐧';;
      FreeBSD ) PS_SYMBOL='😈';;
      *       ) PS_SYMBOL='→';;
  esac
fi

function __prompt_basic() {
    if [[ $PWD == "$HOME" ]]; then
        echo -n "$YELLOW""is home ♥️""$STOP"
    else
        echo -n "in $YELLOW""$(basename "$PWD")""$STOP"
    fi
}

function __prompt_last_exit_code() {
    [[ $1 != 0 ]] && echo -n "$RED"" and coughed a $1""$STOP"
}

function __prompt_pyenv_version() {
    [[ "$PYENV_VERSION" ]] && echo -ne "$CYAN"" hissing in $PYENV_VERSION \xf0\x9f\x90\x8d""$STOP"
}

function __prompt_git_info() {
    local STATUS='';
    local BRANCH_NAME='';

    if [[ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]]; then
        if [[ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null

            # Check for uncommitted changes
            if ! git diff --quiet --ignore-submodules --cached; then
                STATUS+=":us";
            fi

            # Check for unstaged changes.
            if ! git diff-files --quiet --ignore-submodules --; then
                STATUS+=":us";
            fi

            # Check for untracked files.
            if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
                STATUS+=":ut";
            fi

            # Check for stashed files.
            if git rev-parse --verify refs/stash &>/dev/null; then
                STATUS+=":st";
            fi
        fi;

        # Get the short symbolic ref. If HEAD isn’t a symbolic ref, get the
        # short SHA for the latest commit Otherwise, just give up.
        BRANCH_NAME="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";

        [ -n "${STATUS}" ] && STATUS="${FADED_PURPLE}${STATUS}${STOP}";
        echo -ne "${PURPLE} on ᚠ ${BRANCH_NAME}${STOP}${STATUS}"

    else
        return
    fi
}

function __prompt() {
    local EXIT_CODE=$?

    __prompt_basic
    __prompt_git_info
    __prompt_pyenv_version

    if [[ "$PWD" == "$HOME" ]]; then
        echo -n " "
    fi

    __prompt_last_exit_code $EXIT_CODE
}

# Spit a random excuse
# shellcheck source=/dev/null
# source "$HOME/.bash_excuses"
# random_excuse | cowsay
# echo ""

# Put everything together
# export PS1="${GREEN}\u${STOP} at ${BLUE}\\h${STOP} \$(__prompt)
# $PS_SYMBOL "
export PS1="${GREEN}\u${STOP} \$(__prompt)
$PS_SYMBOL "

# --- CUSTOM COMMANDS & ALIASES ---

alias co='cd $HOME/code'
alias ep='$EDITOR $HOME/.bash_profile'
alias isodate='date "+%Y-%m-%dT%H.%M.%S"'
alias ll='ls -l'
alias please='sudo'
alias udl='yadm ls-tree --full-tree -r --name-only master'
alias venv_clean='pip uninstall -y $(pip freeze | cut -d= -f1)'
alias worklog='touch "$HOME"/Dropbox/Work/worklog-`date "+%Y-%m-%d"`.md && "$EDITOR" $HOME/Dropbox/Work/worklog-`date "+%Y-%m-%d"`.md'
alias life="sublime \$HOME/Dropbox/Life.md"
alias scratch="sublime \$HOME/Dropbox/Scratchpad.md"
alias lo="cd $HOME/log; yarn new"
if [[ $(uname) == "Darwin" ]]; then
    alias dotfiles-show="defaults write com.apple.Finder AppleShowAllFiles true && killall Finder"
    alias dotfiles-hide="defaults write com.apple.Finder AppleShowAllFiles false && killall Finder"
fi
#command -v exa > /dev/null 2>&1 && alias ls="exa" # Use exa instead of ls if present
alias dro="cd $HOME/Dropbox"
alias dow="cd $HOME/Downloads"
alias des="cd $HOME/Desktop"
alias sf="single-file --back-end jsdom"

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

# For Arch, since I miss 'open' on OS X
[[ -f /etc/arch-release ]] && alias open='xdg-open'

# --- REPLACEMENTS ---

# Use vim if nvim not available
VIM=vim
command -v nvim > /dev/null 2>&1 && VIM=nvim
alias vim='$VIM'
export EDITOR=$VIM
export GIT_EDITOR=$VIM
export MANPAGER="/bin/sh -c \"col -b | $VIM -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# Use ping if prettyping not available
export PINGER=ping
command -v prettyping > /dev/null 2>&1 && PINGER="prettyping --nolegend"
alias ping='$PINGER'

# --- MISCELLANEOUS ---
#
# Source any local files
# Not sure why this returns a non-zero exit...
source_if_exists ~/.bash_profile.local
echo -n ""

# --- REFERENCES ---
#
# Make an animated GIF with ImageMagick
# /usr/local/bin/convert -delay 20 -loop 1 "$@" animated.gif
#
# More git ingo
# https://github.com/riobard/bash-powerline/blob/master/bash-powerline.sh
#
#
# Interesting unicode characters
# ⑂ 𣎴 ౻ ✎
# https://tutorialzine.com/2014/12/you-dont-need-icons-here-are-100-unicode-symbols-that-you-can-use
#
# Customize fzf colors
# https://minsw.github.io/fzf-color-picker/
#
# Bash cheatsheet
# https://devhints.io/bash

