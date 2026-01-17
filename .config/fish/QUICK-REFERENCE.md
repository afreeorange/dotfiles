# Fish Shell Quick Reference

## Install & Setup

```bash
# Install
brew install fish

# Add to shells
echo $(which fish) | sudo tee -a /etc/shells

# Set default
chsh -s $(which fish)

# Install config
./install.fish
```

## Syntax Cheatsheet

| Task | Bash | Fish |
|------|------|------|
| **Variables** |
| Set local | `var=value` | `set var value` |
| Set global | `export VAR=value` | `set -gx VAR value` |
| Use variable | `$VAR` or `${VAR}` | `$VAR` |
| Command sub | `$(cmd)` or `` `cmd` `` | `(cmd)` |
| **Conditionals** |
| If test | `if [ -f file ]` | `if test -f file` |
| If compare | `if [[ $a == $b ]]` | `if test $a = $b` |
| If command | `if command -v git` | `if command -v git` |
| And | `[[ $a ]] && [[ $b ]]` | `test $a; and test $b` |
| Or | `[[ $a ]] \|\| [[ $b ]]` | `test $a; or test $b` |
| **Loops** |
| For loop | `for i in *; do echo $i; done` | `for i in *; echo $i; end` |
| While | `while read line; do ...; done` | `while read line; ...; end` |
| **Functions** |
| Define | `name() { echo $1; }` | `function name; echo $argv[1]; end` |
| Args | `$1 $2 $@ $*` | `$argv[1] $argv[2] $argv` |
| Return | `return 0` | `return 0` |
| **Strings** |
| Concat | `"$a$b"` | `"$a$b"` or `$a$b` |
| Match | `[[ $str == *pattern* ]]` | `string match "*pattern*" $str` |
| Replace | `${var/old/new}` | `string replace old new $var` |
| Split | `IFS=: read -ra arr <<< "$var"` | `string split : $var` |
| **PATH** |
| Add to PATH | `export PATH="/new:$PATH"` | `fish_add_path /new` |
| **Arrays/Lists** |
| Create | `arr=(a b c)` | `set arr a b c` |
| Access | `${arr[0]}` | `$arr[1]` (1-indexed!) |
| All items | `${arr[@]}` | `$arr` |
| Count | `${#arr[@]}` | `count $arr` |

## Common Patterns

### Set environment variable
```fish
# Bash: export EDITOR=nvim
set -gx EDITOR nvim
```

### Add to PATH
```fish
# Bash: export PATH="$HOME/.bin:$PATH"
fish_add_path $HOME/.bin
```

### Check if command exists
```fish
# Bash: if command -v git >/dev/null; then
if command -v git >/dev/null 2>&1
    # do something
end
```

### Check if file exists
```fish
# Bash: if [ -f file ]; then
if test -f file
    # do something
end
```

### Function with args
```fish
# Bash: func() { echo "Hello $1"; }
function func
    echo "Hello $argv[1]"
end
```

### Default value
```fish
# Bash: ${VAR:-default}
# Fish: (multiple ways)
set -q VAR; or set VAR default
# or
test -n "$VAR"; or set VAR default
```

### Command output to variable
```fish
# Bash: result=$(command)
set result (command)
```

### Redirect stderr
```fish
# Bash: command 2>/dev/null
command 2>/dev/null  # same!
```

### Background job
```fish
# Bash: command &
command &  # same!
```

## Colors

```fish
# Bash: echo "${RED}text${STOP}"
echo (set_color red)"text"(set_color normal)

# Available colors:
# black, red, green, yellow, blue, magenta, cyan, white
# brblack, brred, brgreen, bryellow, brblue, brmagenta, brcyan, brwhite
# normal (reset)
```

## Fish-Specific Features

### Abbreviations (better than aliases)
```fish
# Expands in command line before running
abbr -a gs git status
abbr -a gp git push
```

### Universal variables (persist across sessions)
```fish
set -U MY_VAR value  # survives restarts
```

### Better command substitution
```fish
# No need for quotes in many cases
set files (ls)
for file in (find . -name "*.txt")
    echo $file
end
```

### String manipulation
```fish
string match "*pattern*" $var
string replace old new $var
string split : $PATH
string join : $arr
string trim $var
string length $var
string sub -s 2 -l 5 $var  # substring
```

## Configuration Files

- `~/.config/fish/config.fish` - Main config (like .bashrc)
- `~/.config/fish/functions/` - Function files (auto-loaded)
- `~/.config/fish/conf.d/` - Snippets (auto-loaded)
- `~/.config/fish/completions/` - Custom completions

## Useful Commands

```fish
fish_config          # Web-based config UI
fish_update_completions  # Rebuild completions
funced function_name # Edit function in editor
funcsave function_name  # Save function permanently
abbr -a name value   # Add abbreviation
alias name="value"   # Add alias (traditional)
type name            # Show what 'name' is
which name           # Show path to command
```

## Tips

1. **No quotes needed** in many cases where bash requires them
2. **1-indexed arrays** (not 0-indexed like bash)
3. **No special variables** like `$?` - use `$status` instead
4. **No word splitting** - `$var` stays as one argument
5. **Better errors** - fish tells you what's wrong
6. **Auto-suggest** - type part of previous command, press →
7. **Smart completion** - Tab completes everything intelligently
8. **Syntax highlighting** - red = error, blue = command, etc.

## Getting Help

```fish
help                 # Opens web docs
help set            # Help for 'set' command
man fish            # Manual page
type -a command     # Show all definitions
```

## Debugging

```fish
fish -d 2           # Debug level 2
fish --profile /tmp/profile.log  # Profile startup
functions -v name   # Show function verbosely
set -S var          # Show variable info
```
