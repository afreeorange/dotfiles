# dotfiles

#️⃣ Dotfiles, mine. Managed with [yadm](https://yadm.io).

### Usage

Most of this is for macOS which the only thing I use these days 🤷‍♂️

```bash
# Bootstrap will check for Homebrew and install stuff
# specified in ".platform-dependencies/macOS-{version}.
# It will also install all global packages for Node
# and Python.
yadm submodule init

# Update this repo. Will back up dependencies for Node,
# Python and place them in "$HOME/.platform-dependencies"
# using a MAJOR.MINOR number format.
#
# If on macOS, will back up all Homebrew bundles.
udf

# Should run at bootstrap, but install dependencies for
# a given 'platform'. For example, just copy Node 12.14
# to Node 12.17 in $HOME/.platform-dependencies and run
# this while you get coffee ☕️
idf

# Redo yadm if all else fails
hose-yadm
```
