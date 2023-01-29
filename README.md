# Nikhil's Dotfiles

Managed with [yadm](https://yadm.io).

## Usage

Most of this is for macOS which the only thing I use these days 🤷‍♂️ Should work on Linux.

### Bootstrap

```bash
yadm clone git@github.com:afreeorange/dotfiles.git
yadm submodule init
yadm status

# Bootstrap will check for Homebrew and install stuff
# specified in ".platform-dependencies/macOS-{version}.
# It will also install all global packages for Node
# and Python.
yadm bootstrap

# Redo yadm if all else fails
hose-yadm
```

### Structure

| File/Folder                    | Purpose                                                               |
|--------------------------------|-----------------------------------------------------------------------|
| `$HOME/.platform-dependencies` | Python, Node, Pipx _global_ dependencies                              |
| `$HOME/.bin`                   | Custom executables                                                    |
| `$HOME/.config`                | Standard XDG Base Directory stuff                                     |
| Other global config crap       | Yarn, iSort, EditorConfig, etc                                        |

### Bash

My preferred shell because I'm too old to change (I do love `fish` tho ♥️.) Quite the elaborate setup in `~/.config/bash`.

### `$HOME/.bin`

Random assortment of utilities. Here are some interesting ones.

#### `worklog`

Maintain a quick log of things I do at work

```bash
# Create a new log (Will be in ~/Dropbox/Work by default)
worklog

# Pull up yesterdays work (or the last log if yesterday is not found)
worklog -1

# List all the logs
worklog l

# Get the 12th log in the listing
worklog 12
```

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

#### `gif-to-mp4`

Convert a GIF to MP4 using `ffmpeg`

#### [`gh-md-toc`](https://github.com/ekalinin/github-markdown-toc)

(Cached) Make a table of contents from a Markdown doc.

#### [`semver`](https://github.com/fsaintjacques/semver-tool)

(Cached) Manipulate semantic versioning.

---

## Misc

If ubuntu check for bootstrap
Add `apt -y install locales` for `LC_ALL` error...

