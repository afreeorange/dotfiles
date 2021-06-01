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

# Set everything up 🤞
setup-apps

# Redo yadm if all else fails
hose-yadm
```

### Structure

|          File/Folder           |                               Purpose                                |
|--------------------------------|----------------------------------------------------------------------|
| `$HOME/.platform-dependencies` | Python, Node, Pipx _global_ dependencies                             |
| `$HOME/.bin`                   | Custom executables                                                   |
| `$HOME/.config`                | Standard XDG Base Directory stuff                                    |
| `$HOME/.completions`           | `bash` completions that I copy and place here for some reason        |
| `$HOME/.bash_colors`           | Sourced for any colors (like in my prompt)                           |
| `$HOME/.bash_excuses`          | Developer excuses for use with `cowsay` 🐮 and automated `git` pushes |
| Other global config crap       | Yarn, iSort, EditorConfig, etc                                       |

### `$HOME/.bin`

Random assortment of utilities. Here are some interesting ones.

#### `udf`

Update Dot Files. Will back up Python, Node, macOS and other dependencies.

#### `ipd`

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

#### `engage`

Play some white noise from the Engine Room of the NCC-1701. Kinda. Best on headphones. Needs `sox` installed.

#### `dataurl`

Make a Base64 [dataurl](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs) from the argument.

#### [`gh-md-toc`](https://github.com/ekalinin/github-markdown-toc)

(Cached) Make a table of contents from a Markdown doc.

#### [`semver`](https://github.com/fsaintjacques/semver-tool)

(Cached) Manipulate semantic versioning.
