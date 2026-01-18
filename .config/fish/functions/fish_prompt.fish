switch (uname)
    case Darwin
        set -g PS_SYMBOL ""
    case Linux
        set -g PS_SYMBOL "🐧"
    case FreeBSD
        set -g PS_SYMBOL "😈"
    case '*'
        set -g PS_SYMBOL "→"
end

# Show random excuse on startup
if command -v cowsay >/dev/null 2>&1
    if functions -q random_excuse
        random_excuse | cowsay -s
        echo ""
    end
end

function fish_prompt
    set -l last_status $status

    # User and host
    echo -n (set_color green)(whoami)(set_color normal)" "(set_color blue)"at "(hostname)(set_color normal)" "

    # Location
    if test $PWD = $HOME
        echo -n (set_color yellow)"is home ♥️"(set_color normal)
    else
        echo -n (set_color yellow)"in "(basename $PWD)(set_color normal)
    end

    # Git info
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        if test (git rev-parse --is-inside-git-dir 2>/dev/null) = false
            set -l STATUS ""

            # Update index
            git update-index --really-refresh -q >/dev/null 2>&1

            # Check for uncommitted changes
            if not git diff --quiet --ignore-submodules --cached
                set STATUS "$STATUS:uc"
            end

            # Check for unstaged changes
            if not git diff-files --quiet --ignore-submodules --
                set STATUS "$STATUS:us"
            end

            # Check for untracked files
            if test -n (git ls-files --others --exclude-standard)
                set STATUS "$STATUS:ut"
            end

            # Check for stashed files
            if git rev-parse --verify refs/stash >/dev/null 2>&1
                set STASH_LENGTH (git stash list | wc -l | string trim)
                set STATUS "$STATUS:st($STASH_LENGTH)"
            end

            # Branch name
            set BRANCH_NAME (git symbolic-ref --quiet --short HEAD 2>/dev/null; or git rev-parse --short HEAD 2>/dev/null; or echo '(unknown)')

            if test -n "$STATUS"
                echo -n (set_color magenta)" on  $BRANCH_NAME"(set_color normal)(set_color brmagenta)"$STATUS"(set_color normal)
            else
                echo -n (set_color magenta)" on  $BRANCH_NAME"(set_color normal)
            end
        end
    end

    # Last exit code
    if test $last_status -ne 0
        echo -n (set_color red)" coughed a $last_status"(set_color normal)
    end

    # New line and symbol
    echo ""
    echo -n "$PS_SYMBOL "
end
