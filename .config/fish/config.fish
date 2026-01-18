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
    # 15-aliases: Shortcuts
    # ============================================================================

    set -g CLOUD_FOLDER "$HOME/Dropbox"

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

    # For ls colors
    set -gx CLICOLOR 1
    set -gx LSCOLORS ExGxFxDxCxHxHxCbCeEbEb

    # Base16 shell theme
    source_if_exists "$HOME/.config/base16-shell/base16-shell.plugin.fish"

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
