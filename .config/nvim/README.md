Completion (nvim-cmp)

- Auto-pops up eagerly after 1 character typed
- Arrow keys to navigate the menu
- <Tab> to accept the selected item
- <CR> to confirm (only if you explicitly selected something)
- <C-Space> to manually trigger completion
- Sources: LSP, snippets, buffer words, file paths

LSP keybindings (active in any buffer with an LSP attached)

- gd — go to definition
- gD — go to declaration
- K — hover docs (see definition/signature)
- gr — references
- gi — implementation
- <leader>D — type definition
- <leader>rn — rename symbol
- <leader>ca — code action
- [d / ]d — prev/next diagnostic

LSP servers — managed via Mason. Three auto-installed: lua_ls, ts_ls (TypeScript), pyright (Python). To add more, run :Mason in Neovim or add to the
ensure_installed list.

Open Neovim and let Lazy install the new plugins (:Lazy sync), then Mason will auto-install the language servers. Note: <C-b> is now overloaded
(NvimTreeToggle vs scroll docs) — the completion mapping only activates in insert mode so there's no conflict.
