# dotfiles

Dotfiles, mine. Managed with [yadm](https://yadm.io).

## Usage

Most of this is for macOS which the only thing I use these days 🤷‍♂️ Should work on Linux.

### Bootstrap

```bash
# Bootstrap will check for Homebrew and install stuff
# specified in ".platform-dependencies/macOS-{version}.
# It will also install all global packages for Node
# and Python.
yadm submodule init

# Redo yadm if all else fails
hose-yadm
```

### Structure

|             Folder             |                            Purpose                            |
|--------------------------------|---------------------------------------------------------------|
| `$HOME/.platform-dependencies` | Python, Node, Pipx _global_ dependencies                      |
| `$HOME/.bin`                   | Custom executables                                            |
| `$HOME/.config`                | Standard XDG Base Directory stuff                             |
| `$HOME/.completions`           | `bash` completions that I copy and place here for some reason |

### `udf`

Update Dot Files. Will back up Python, Node, macOS and other dependencies.

### `ipd`

Install Platform Dependencies. Given the detected version of macOS or Python or Node, install all the _global_ dependencies.

```bash
# Install all dependencies
ipd

# Install node, python, brew, or pipx
ipd node
ipd python
ipd brew
ipd pipx
```
