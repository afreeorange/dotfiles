# Neovim Config

## Keymaps

### General

| Key | Action |
|-----|--------|
| `<leader>ep` | Open nvim config dir |
| `<leader>qq` | Quit all (force) |
| `<leader>qs` | Save & quit all |
| `<leader>\|` | Vertical split |
| `<Esc>` | Clear search highlight |

### Tabs

| Key | Action |
|-----|--------|
| `Ctrl+N` | New tab |
| `<leader>tc` | Close tab |

### VSCode-like (Cmd → Alt)

| Key | Action | VSCode equivalent |
|-----|--------|-------------------|
| `Alt+S` | Save | `Cmd+S` |
| `Alt+Shift+S` | Save all | `Cmd+Shift+S` |
| `Alt+Q` | Quit window | `Cmd+Q` |
| `Alt+W` | Close buffer | `Cmd+W` |
| `Alt+Z` | Toggle wrap | `Alt+Z` |
| `Alt+Shift+Z` | Redo | `Cmd+Shift+Z` |
| `Alt+D` | Duplicate line | — |
| `Alt+Shift+K` | Delete line | `Cmd+Shift+K` |
| `Alt+Up/Down` | Move line up/down | `Alt+Up/Down` |
| `Alt+] / Alt+[` | Indent / Outdent | `Cmd+] / Cmd+[` |
| `Alt+/` | Toggle comment | `Cmd+/` |
| `Alt+Shift+Q` | Hard-wrap to textwidth | — |
| `Alt+F` | Zen Mode | — |
| `Alt+Shift+F` | Search across files | `Cmd+Shift+F` |
| `Alt+G` | Go to line | `Cmd+G` |
| `Alt+A` | Select all | `Cmd+A` |
| `Alt+Enter` | Insert blank line below | `Cmd+Enter` |
| `Alt+L` | Toggle relative line numbers | — |
| `Alt+Shift+L` | Toggle line numbers | — |

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+B` | Toggle file tree |
| `Ctrl+P` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader><space>` | Buffers (Telescope) |
| `<leader>fs` | Fuzzy find in buffer |
| `Ctrl+H/J/K/L` | Move between windows |
| `Shift+H` | Previous buffer |
| `Shift+L` | Next buffer |

### LSP (active when LSP attached)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `K` | Hover docs |
| `gr` | References |
| `gi` | Implementation |
| `<leader>D` | Type definition |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` / `]d` | Prev / next diagnostic |

## Completion (nvim-cmp)

- Auto-pops after 1 character
- Arrow keys to navigate
- `<Tab>` to accept selected item
- `<CR>` to confirm (only if explicitly selected)
- `<C-Space>` to manually trigger
- Sources: LSP → snippets → buffer words → file paths

## LSP Servers

Managed via Mason. Auto-installed:

`lua_ls` `ts_ls` `pyright` `gopls` `rust_analyzer` `cssls` `html` `jsonls` `bashls` `tailwindcss` `yamlls` `somesass_ls`

`ts_ls` is configured to use the global TypeScript install via mise (`~/.local/share/mise/installs/node/23.11.1`) since Mason's bundled TS7 dropped `tsserver.js`.

To add more: run `:Mason` or add to `ensure_installed` in `lua/plugins/lsp.lua`.

## Notes

- `<C-b>` is overloaded (NvimTreeToggle vs scroll docs in cmp) — no conflict since cmp mapping only activates in insert mode
- Alt keymaps use macOS Unicode dead-key characters (e.g. `ß` = Alt+S, `∑` = Alt+W). These work in terminals that pass Option as Meta
