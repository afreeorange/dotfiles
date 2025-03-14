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

In `.bin` or in the [elaborate bash configuration](https://github.com/afreeorange/dotfiles/tree/master/.config/bash)

## Other Notes

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
