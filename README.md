# Nikhil's Dotfiles

Managed with [yadm](https://yadm.io) which will need to be installed on the system. Works fine on macOS and Ubuntu which are the only two OSes I use these days. Needs [asdf](https://asdf-vm.com/) to manage runtimes (will be installed at bootstrap).

```bash
# This should run bootstrap
yadm clone git@github.com:afreeorange/dotfiles.git
yadm decrypt

# Re-run if things changae
udf
yadm bootstrap

# Redo yadm if you borked things somehow.
hose-yadm
```

## Some Executables

In `.bin` or in the [elaborate bash configuration](https://github.com/afreeorange/dotfiles/tree/master/.config/bash).

### `worklog`

Maintain a quick log of things I do at work. Simple note-taking. Syncs to Dropbox.

```bash
# Show usage
worklog h

# Create a new log (Will be in ~/Dropbox/Work by default)
worklog

# Pull up yesterdays work (or the last log if yesterday is not found)
worklog -1

# List all the logs
worklog l

# Get the 12th log in the listing
worklog 12
```

### `udf`

Update Dot Files. Will back up Python, Node, macOS and other dependencies.

### `ipd`

Install Platform Dependencies: given the detected version of macOS or Python or Node, install all the _global_ dependencies.

```bash
# Install all dependencies
ipd

# Individually
ipd node
ipd python
ipd brew
```

### `engage`

Play some white noise from the Engine Room of the NCC-1701. Kinda. Best on headphones. Needs `sox` installed.

### `dataurl`

Make a Base64 [dataurl](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs) from the argument.

### `random_excuse`

Generate a random [developer excuse](https://sorry.nikhil.io/).

### `random_commit_message`

Generate a random commit message.
