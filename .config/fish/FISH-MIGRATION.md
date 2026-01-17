# Bash to Fish Shell Migration Guide

## Installation

### 1. Install Fish Shell

**macOS:**
```bash
brew install fish
```

**Linux:**
```bash
sudo apt-get install fish  # Debian/Ubuntu
sudo dnf install fish      # Fedora
sudo pacman -S fish        # Arch
```

### 2. Set Fish as Default Shell

```bash
# Add fish to valid shells
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells  # macOS Apple Silicon
# OR
echo /usr/local/bin/fish | sudo tee -a /etc/shells     # macOS Intel
# OR
echo /usr/bin/fish | sudo tee -a /etc/shells           # Linux

# Change default shell
chsh -s $(which fish)
```

### 3. Install Configuration

```bash
# Create fish config directory
mkdir -p ~/.config/fish

# Copy main config
cp fish-config.fish ~/.config/fish/config.fish

# Copy random functions
cp random-functions.fish ~/.config/fish/functions/random-functions.fish
```

## Key Differences Between Bash and Fish

### Syntax Changes

| Bash | Fish | Notes |
|------|------|-------|
| `export VAR=value` | `set -gx VAR value` | `-g` = global, `-x` = export |
| `VAR=value` | `set VAR value` | Local variable |
| `$VAR` | `$VAR` | Variable expansion (same) |
| `$(command)` | `(command)` | Command substitution |
| `${VAR}` | `$VAR` or `{$VAR}` | Braces optional in fish |
| `if [ condition ]` | `if test condition` | Fish uses `test` |
| `[[ condition ]]` | `test condition` | No double brackets |
| `$1, $2` | `$argv[1], $argv[2]` | Function arguments |
| `$@` | `$argv` | All arguments |
| `function name() { }` | `function name; end` | Different syntax |
| `for i in *; do` | `for i in *` | No `do`/`done` |
| `source file` | `source file` | Same |

### PATH Management

Bash:
```bash
export PATH="/new/path:$PATH"
```

Fish:
```fish
fish_add_path /new/path
# OR
set -gx PATH /new/path $PATH
```

### History

Fish has automatic:
- Syntax highlighting
- Auto-suggestions from history
- Smart completion
- No need to configure HISTSIZE/HISTFILESIZE

### Shell Options

Most bash `shopt` options are automatic in fish:
- `cdspell` → fish auto-corrects paths
- `checkwinsize` → fish auto-updates LINES/COLUMNS
- `histappend` → fish handles history automatically
- `nocaseglob` → fish does case-insensitive completion

## Post-Installation

### Install Additional Tools

```bash
# FZF (fuzzy finder)
brew install fzf
$(brew --prefix)/opt/fzf/install

# Atuin (history)
brew install atuin

# Mise (version manager)
brew install mise

# Base16 shell themes
git clone https://github.com/tinted-theming/base16-shell.git ~/.config/base16-shell
```

### Fish-Specific Plugins (Optional)

```bash
# Install fisher (plugin manager)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Popular plugins
fisher install jethrokuan/z          # Directory jumping
fisher install PatrickF1/fzf.fish    # FZF integration
fisher install jorgebucaran/nvm.fish # Node version manager
```

## Completion Files

Fish auto-loads completions from:
- `~/.config/fish/completions/` (user)
- `/usr/share/fish/completions/` (system)

Your bash completions in `completions/` directory need manual conversion or:
1. Check if fish already has them (most common tools do)
2. Use tool-specific fish completion generators
3. Convert manually using fish completion syntax

### Example: AWS Completion

Already handled in config:
```fish
if command -v aws_completer >/dev/null 2>&1
    complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end
```

## Testing Your Config

1. Start new fish shell: `fish`
2. Test aliases: `gs`, `ll`, `p`, etc.
3. Test functions: `mkcd test`, `hs`, etc.
4. Check PATH: `echo $PATH`
5. Check git prompt: `cd` into a git repo
6. Test completions: type `git` and press Tab

## Troubleshooting

### Issue: Base16 not loading
```fish
# Check if file exists
ls ~/.config/base16-shell/

# Manually source
source ~/.config/base16-shell/base16-shell.plugin.fish
```

### Issue: Completions not working
```fish
# Rebuild completions
fish_update_completions
```

### Issue: Prompt not showing
```fish
# Test prompt function
fish_prompt
```

### Issue: Colors wrong
```fish
# Check set_color support
set_color --print-colors
```

## What Was Converted

✅ Environment variables (exports)
✅ Path configuration
✅ All aliases
✅ All functions
✅ Git prompt with status
✅ Mise activation
✅ FZF configuration
✅ Atuin integration
✅ Color definitions
✅ Command replacements (vim, ping)
✅ Random commit/excuse functions

## What Needs Manual Setup

⚠️ Bash completions (may need fish-specific versions)
⚠️ Base16 theme (install separately)
⚠️ GRC (generic colorizer) - install if needed
⚠️ Tool-specific configs (Docker, git, etc.)

## Tips

1. Fish has better defaults - less config needed
2. Use `fish_config` for web-based configuration
3. Type `help` in fish for built-in documentation
4. Fish script syntax is cleaner but different
5. No need for semicolons or explicit subshells
6. Universal variables persist across sessions: `set -U`

## Learning Resources

- Official: https://fishshell.com/docs/current/
- Tutorial: https://fishshell.com/docs/current/tutorial.html
- Cookbook: https://github.com/jorgebucaran/cookbook.fish

## Reverting to Bash

If you need to switch back:
```bash
chsh -s /bin/bash
```

Your bash config is unchanged in `.bashrc` or `.bash_profile`.
