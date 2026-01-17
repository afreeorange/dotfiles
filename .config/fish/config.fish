if status is-interactive
    # ============================================================================
    # 00-exports: Environment variables
    # ============================================================================

    # Unicode (macOS only)
    if test (uname) = Darwin
        set -gx LC_ALL en_US.UTF-8
        set -gx LANG en_US.UTF-8
    end

    set -gx fish_history_size 999999999

    # Path configuration
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.bin
    fish_add_path $HOME/.local/bin

    # macOS Apple Silicon path
    if test (uname) = Darwin; and test (uname -m) = arm64
        fish_add_path /opt/homebrew/bin
    end

    # FZF configuration
    set -gx FZF_DEFAULT_COMMAND "fd \
   --type f \
   --hidden \
   --follow \
   --exclude .git \
   --exclude .nvm \
   --exclude node_modules"
    set -gx FZF_DEFAULT_OPTS --ansi

    # AWS
    set -gx AWS_PROFILE "nikhil.io"
    set -gx AWS_DEFAULT_REGION us-east-1

    # Homebrew (macOS)
    if test (uname) = Darwin
        set -gx HOMEBREW_NO_ENV_HINTS 1
        set -gx HOMEBREW_NO_ANALYTICS 1
        set -gx HOMEBREW_NO_AUTO_UPDATE 1
    end

    # ============================================================================
    # 10-options: Shell options (Fish has sensible defaults)
    # ============================================================================

    # Fish automatically:
    # - corrects typos in paths
    # - updates terminal size
    # - handles history well
    # - does case-insensitive completion

    # ============================================================================
    # 11-functions: Helper functions
    # ============================================================================

    function source_if_exists
        test -e $argv[1]; and source $argv[1]
    end

    function warn
        echo (set_color red)"❕$argv[1]"(set_color normal)
    end

    function dataurl
        set MIMETYPE (file -b --mime-type $argv[1])

        if string match -q "text/*" $MIMETYPE
            set MIMETYPE "$MIMETYPE;charset=utf-8"
        end

        echo "data:$MIMETYPE;base64,"(openssl base64 -in $argv[1] | tr -d '\n')
    end

    function s3_bucket_size
        aws s3 ls --summarize --human-readable --recursive $argv[1]
    end

    function hs
        set WORKING_DIR (pwd)

        if test -n "$argv[1]"
            set WORKING_DIR $argv[1]
        end

        echo "Using this as root: $WORKING_DIR"
        echo "Starting server at"
        echo "http://127.0.0.1:8080"
        echo "─────────────────────────────────────────────────────────────────"

        caddy file-server \
            --access-log \
            --browse \
            --reveal-symlinks \
            --listen 127.0.0.1:8080 \
            --root $WORKING_DIR
    end

    function ydlp
        set file (yt-dlp --print "%(filename)s" $argv)

        echo "Downloading $file"
        yt-dlp $argv

        echo "Converting $file"
        ffmpeg -i $file "OUTPUT-$file.mp4"
    end

    function draw_line
        set LINE_CHAR $argv[1]
        set WIDTH (tput cols)
        printf '%*s' $WIDTH '' | tr ' ' $LINE_CHAR
    end

    function mkcd
        mkdir -p $argv[1]
        cd $argv[1]
    end

    function mksh
        if test (count $argv) -ne 1
            echo 'mksh takes one argument' >&2
            return 1
        else if test -e $argv[1]
            echo "$argv[1] already exists" >&2
            return 1
        end

        echo '#!/bin/env bash
set -euo pipefail

' >$argv[1]

        chmod u+x $argv[1]
    end

    # ============================================================================
    # 15-aliases: Shortcuts
    # ============================================================================

    set CLOUD_FOLDER "$HOME/Dropbox"

    alias e="\$EDITOR"
    alias ep="\$EDITOR \$HOME/.config/fish/"
    alias isodate='date "+%Y-%m-%dT%H.%M.%S"'
    alias ll="ls -l"
    alias please="sudo"
    alias udl="yadm ls-tree --full-tree -r --name-only master"
    alias venv_clean="pip uninstall -y (pip freeze | cut -d= -f1)"
    alias life="code \$CLOUD_FOLDER/Life.md"
    alias scratch="code \$CLOUD_FOLDER/Scratchpad.md"
    alias clo="cd \$HOME/Programming/log"
    alias col="cd \$HOME/Programming/columbia-notes && code ."
    alias wik="cd \$HOME/Programming/wiki.nikhil.io.articles"
    alias wiki="cd \$HOME/Programming/wiki.nikhil.io.articles"

    if test (uname) = Darwin
        alias dotfiles-show="defaults write com.apple.Finder AppleShowAllFiles true && killall Finder"
        alias dotfiles-hide="defaults write com.apple.Finder AppleShowAllFiles false && killall Finder"
    end

    alias vnc_tunnel="ssh -p 3689 -L 5901:127.0.0.1:5901 -N -f -l nikhil 10.212.8.10"
    alias ora="ssh nikhil@10.212.8.10 -p 3689"
    alias p="pnpm"
    alias y="yadm"
    alias m='navidrome --musicfolder="$HOME/Music/Library/" --datafolder="$HOME/Music/Navidrome/" --nobanner'
    alias cla="cd \$CLOUD_FOLDER/Classes"
    alias uvp="uv run python"
    alias ipy="ipython"
    alias cd..='cd ..'
    alias mdkir='mkdir'
    alias dc='cd'
    alias sl='ls'
    alias sudp='sudo'
    alias pact="source ./.venv/bin/activate"

    # Locations
    alias co="cd \$HOME/Programming"
    alias des="cd \$HOME/Desktop"
    alias doc="cd \$HOME/Documents"
    alias dow="cd \$HOME/Downloads"
    alias per="cd \$HOME/Programming"
    alias mus="cd \$HOME/Music"
    alias pic="cd \$HOME/Pictures"
    alias pro="cd \$HOME/Projects"

    function dro
        cd $CLOUD_FOLDER
    end

    # Moving around
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."

    # Docker
    alias dkill="docker kill (docker ps -aq)"
    alias drm="docker rm -f (docker ps -aq)"
    alias drmi="docker rmi -f (docker images -q)"

    # Git
    alias gs="git status"
    alias gd="git diff"
    alias ga="git add"
    alias gc="git commit"
    alias gco="git checkout"
    alias gp="git pull origin (git branch --show-current)"
    alias gl="git log --oneline --abbrev-commit --all --graph --decorate --color"
    alias grm="git rm (git ls-files --deleted)"
    alias gpt="git push origin (git branch --show-current) --tags"
    alias gpb="git push origin (git branch --show-current)"
    alias gpom="git pull origin master"
    alias grao="git remote add origin"
    alias grv="git remote -v"

    # Miscellaneous (macOS)
    if test (uname) = Darwin
        alias kd="killall Dock"
        alias bru="brew cleanup && brew update && brew upgrade"
        alias o="open"
    end

    alias engage="play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25 fade h 1 864000 1"

    # ============================================================================
    # 20-colors: Color definitions
    # ============================================================================

    # Fish uses set_color instead of tput
    # Colors are built-in: red, green, blue, yellow, cyan, magenta, white, black, etc.
    # You can use set_color directly in fish

    # For ls colors
    set -gx CLICOLOR 1
    set -gx LSCOLORS ExGxFxDxCxHxHxCbCeEbEb

    # Base16 shell theme
    source_if_exists "$HOME/.config/base16-shell/base16-shell.plugin.fish"

    # Set theme (uncomment one)
    # base16_gruvbox-dark-hard

    # GRC colorizer (macOS)
    if test (uname) = Darwin
        set -gx GRC_ALIASES true
        source_if_exists (brew --prefix)"/etc/grc.fish"
    end

    # ============================================================================
    # 40-version-manager: mise
    # ============================================================================

    if command -v mise >/dev/null 2>&1
        mise activate fish | source
    else
        echo "⚠️ You haven't installed mise"
    end

    # ============================================================================
    # 70-prompt: Custom prompt (Fish has its own prompt system)
    # ============================================================================

    # Set PS symbol based on OS
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
                    echo -n (set_color magenta)" on  $BRANCH_NAME"(set_color normal)(set_color brmagenta)"$STATUS"(set_color normal)
                else
                    echo -n (set_color magenta)" on  $BRANCH_NAME"(set_color normal)
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

    # Show random excuse on startup
    if command -v cowsay >/dev/null 2>&1
        if functions -q random_excuse
            random_excuse | cowsay -s
            echo ""
        end
    end

    # ============================================================================
    # 80-completions: Completion setup
    # ============================================================================

    # FZF
    if test (uname) = Darwin
        test -f ~/.fzf.fish; and source ~/.fzf.fish
        test -f ~/.fzf.git.fish; and source ~/.fzf.git.fish
    else if test (uname) = Linux
        test -f /usr/share/doc/fzf/examples/key-bindings.fish; and source /usr/share/doc/fzf/examples/key-bindings.fish
    end

    # Atuin (history)
    if command -v atuin >/dev/null 2>&1
        atuin init fish --disable-up-arrow | source
    end

    # Custom completions - Fish will auto-load from ~/.config/fish/completions/

    # AWS completion
    if command -v aws_completer >/dev/null 2>&1
        complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
    end

    # ============================================================================
    # 95-replacements: Command replacements
    # ============================================================================

    # Vim/Neovim
    if command -v nvim >/dev/null 2>&1
        set -gx EDITOR nvim
        alias vim="nvim"
    else
        set -gx EDITOR vim
    end

    set -gx GIT_EDITOR $EDITOR
    set -gx MANPAGER "/bin/sh -c \"col -b | $EDITOR -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

    # Prettyping
    if command -v prettyping >/dev/null 2>&1
        alias ping="prettyping --nolegend"
    end

    # Arch Linux open command
    if test -f /etc/arch-release
        alias open="xdg-open"
    end

    # ============================================================================
    # 99-local: Source local config
    # ============================================================================

    source_if_exists ~/.config/fish/config.local.fish
end
