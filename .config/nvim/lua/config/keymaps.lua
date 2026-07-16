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

-- Toggle Comment (Alt+/)
vim.keymap.set("n", "÷", "gcc", { remap = true, silent = true })
vim.keymap.set("v", "÷", "gc", { remap = true, silent = true })

-- Hard-wrap text to textwidth (Alt+Shift+q)
vim.keymap.set("n", "Œ", "gqq", { noremap = true, silent = true })
vim.keymap.set("v", "Œ", "gq", { noremap = true, silent = true })

-- Toggle Zen Mode (Alt+f)
vim.keymap.set("n", "ƒ", "<cmd>ZenMode<cr>", {
  noremap = true,
  silent = true
})

-- Shortcut to toggle tree
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", {
  noremap = true,
  silent = true
})

-- Telescope
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files hidden=true<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- -- General
-- map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
-- map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- -- Window navigation
-- map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- -- Buffer navigation
-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- -- Move lines in visual mode
-- map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
-- map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- -- Better indenting (stay in visual mode)
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
