-- References
-- https://github.com/bugb/dotfiles/blob/main/.config/nvim/core/options.lua
vim.keymap.set("n", "<leader>ep", "<cmd>e ~/.config/nvim<cr>", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<leader>qs", "<cmd>wqa<CR>", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", {
    noremap = true,
    silent = true
})

------------------------------- Tabs -----------------------------------------
vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "”", "<cmd>tabprevious<CR>", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "’", "<cmd>tabnext<CR>", {
    noremap = true,
    silent = true
})
-- TODO: Tab Close
------------------------------------------------------------------------------

-- Toggle Wrapping (Alt+z)
vim.keymap.set("n", "Ω", "<cmd>set wrap!<cr>", {
    noremap = true,
    silent = true
})

-- Quit (Alt+q)
vim.keymap.set("n", "œ", "<cmd>q<cr>", {
    noremap = true,
    silent = true
})

-- Save file (Alt+s)
vim.keymap.set("n", "ß", "<cmd>w<cr>", {
    noremap = true,
    silent = true
})

-- Duplicate a lint (Alt+d)
vim.keymap.set("n", "∂", "mzyyp`z", {
    noremap = true,
    silent = true
})

-- Toggle Relative Line Numbering (Alt+l)
vim.keymap.set("n", "¬", "<cmd>set relativenumber!<cr>", {
    noremap = true,
    silent = true
})

-- Toggle Line Numbering entirely (Alt+Shift+l)
vim.keymap.set("n", "Ò", "<cmd>set nonumber!<cr>", {
  noremap = true,
  silent = true
})

-- Toggle Zen Mode (Alt+f)
vim.keymap.set("n", "ƒ", "<cmd>ZenMode<cr>", {
    noremap = true,
    silent = true
})

