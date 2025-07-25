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

## Bash (and Completions) on macOS

You need to use the Homebrew `bash` (v5) else you will get errors with `bash-completion`.

```bash
# Contains a list of approved shells. You'll need to add
# the Homebrew one here.
more /etc/shells

# Install the necessary
brew install bash bash-completion@2

# Add to list of shells
echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells

# Change your shell
chsh -s "$(brew --prefix)/bin/bash"
```

Now add these wherever

```bash
source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
```

[Find more completions here](https://github.com/scop/bash-completion/tree/51b009f6a653c66454816e9bc869c40f61329764/completions). Run `_complete` or `_c` to load completions (they delay session startup time a _lot_).

Bash setup was inspired by [this](https://write.as/bpsylevc6lliaspe.md) and [this](https://lobste.rs/s/r1tpld/your_bashrc_doesn_t_have_be_mess).

## Some Executables

In `.bin` or in the [elaborate bash configuration](https://github.com/afreeorange/dotfiles/tree/master/.config/bash)

## Other Notes

### Version Manager

Migrated to `mise` after using `asdf` [because of this](https://asdf-vm.com/guide/upgrading-to-v0-16.html#asdf-global-and-asdf-local-commands-have-been-replaced-with-asdf-set) design choice. It's much cleaner and simple. I like global installs.

```bash
# List all installable things (searchable interface!)
mise use

# List versions of installable stuff
mise ls-remote node

# Install a specific thing
mise i node@20

# Make a specific thing global (will download if not present)
mise use --global node@24

# List installed things
mise ls

# Upgrade all tools
mise up --bump

# Clean things
mise prune

# Install stuff in .tool-versions
mise i
```

### Karabiner

If you need <kbd>ctrl</kbd>+<kbd>`</kbd> in VSCode to dismiss the search panel,

```json
{
  "description": "Map (Left Control + Left Command + Esc) to (Ctrl + `) for VSCode",
  "manipulators": [
    {
      "type": "basic",
      "from": {
        "key_code": "escape",
        "modifiers": {
          "mandatory": ["left_control", "left_command"]
        }
      },
      "to": [
        {
          "key_code": "grave_accent_and_tilde",
          "modifiers": ["left_control"]
        }
      ]
    }
  ]
}
```

Not adding this since <kbd>cmd</kbd>+<kbd>j</kbd> works just fine.

## References

* [More git info](https://github.com/riobard/bash-powerline/blob/master/bash-powerline.sh)
* [Unicode Symbols](https://tutorialzine.com/2014/12/you-dont-need-icons-here-are-100-unicode-symbols-that-you-can-use) - ⑂ 𣎴 ౻ ✎
* [Customize fzf colors](https://minsw.github.io/fzf-color-picker/)
* [Bash cheatsheet](https://devhints.io/bash)
