# dotfiles

#️⃣ Dotfiles, mine. Managed with [yadm](https://yadm.io).

### Usage

All this is for macOS which the only thing I use these days 🤷‍♂️

```bash
# Bootstrap will check for Homebrew and install stuff
# specified in ".platform-dependencies/macOS-{version}.
# Assuming this goes well,
yadm submodule init

# Update this repo
udf

# Update Homebrew manifest
udf b

# Update dependencies for Node, Python and place them in
# "$HOME/.platform-dependencies" using a full version number
# (whatever's reported by the interpreter.)
udf d

# Redo yadm if all else fails
hose-yadm
```