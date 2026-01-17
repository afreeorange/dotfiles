#!/bin/bash

# Why not?
if [[ -z "$PS_SYMBOL" ]]; then
    case "$(uname)" in
    Darwin) PS_SYMBOL="" ;;
    Linux) PS_SYMBOL="🐧" ;;
    FreeBSD) PS_SYMBOL="😈" ;;
    *) PS_SYMBOL="→" ;;
    esac
fi

function __prompt_basic() {
    if [[ $PWD == "$HOME" ]]; then
        echo -n "$YELLOW""is home ♥️""$STOP"
    else
        echo -n "$YELLOW""in $(basename "$PWD")""$STOP"
    fi
}

function __prompt_last_exit_code() {
    [[ $1 != 0 ]] && echo -n "$RED"" coughed a $1""$STOP"
}

function __prompt_pyenv_version() {
    [[ "$PYENV_VERSION" ]] && echo -ne "$CYAN"" hissing in $PYENV_VERSION \xf0\x9f\x90\x8d""$STOP"
}

function __prompt_git_info() {
    local STATUS=""
    local BRANCH_NAME=""

    if [[ $(
        git rev-parse --is-inside-work-tree &>/dev/null
        echo "${?}"
    ) == "0" ]]; then
        if [[ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" == "false" ]]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null

            # Check for uncommitted changes
            if ! git diff --quiet --ignore-submodules --cached; then
                STATUS+=":uc"
            fi

            # Check for unstaged changes.
            if ! git diff-files --quiet --ignore-submodules --; then
                STATUS+=":us"
            fi

            # Check for untracked files.
            if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
                STATUS+=":ut"
            fi

            # Check for stashed files.
            if git rev-parse --verify refs/stash &>/dev/null; then
                local STASH_LENGTH
                STASH_LENGTH=$(git stash list | wc -l | xargs)
                STATUS+=":st($STASH_LENGTH)"
            fi
        fi

        # Get the short symbolic ref. If HEAD isn’t a symbolic ref, get the
        # short SHA for the latest commit Otherwise, just give up.
        BRANCH_NAME="$(git symbolic-ref --quiet --short HEAD 2>/dev/null ||
            git rev-parse --short HEAD 2>/dev/null ||
            echo '(unknown)')"

        [ -n "${STATUS}" ] && STATUS="${FADED_PURPLE}${STATUS}${STOP}"
        echo -ne "${PURPLE} on  ${BRANCH_NAME}${STOP}${STATUS}"

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

# Spit out a random excuse <3
command -v cowsay >/dev/null 2>&1 && {
    # shellcheck source=/dev/null
    random_excuse | cowsay -s
    echo ""
}

# Put everything together
export PS1="${GREEN}\u${STOP} ${BLUE}at \\h${STOP} \$(__prompt)
$PS_SYMBOL "

# export PS1="${GREEN}\u${STOP} \$(__prompt)
# $PS_SYMBOL "
