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
-- Tab close
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { noremap = true, silent = true })
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

-- Clear search highlight (Esc, like VSCode)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { silent = true })

------------------------------- VSCode-like (Cmd → Alt) ----------------------

-- Close buffer (Alt+w, like Cmd+W)
vim.keymap.set("n", "∑", "<cmd>bd<cr>", { noremap = true, silent = true })

-- Undo (Alt+u, like Cmd+Z) — also works with native 'u'
vim.keymap.set("n", "<A-z>", "u", { noremap = true, silent = true })

-- Redo (Alt+Shift+z, like Cmd+Shift+Z)
vim.keymap.set("n", "¸", "<C-r>", { noremap = true, silent = true })

-- Delete line (Alt+Shift+k, like Cmd+Shift+K)
vim.keymap.set("n", "<A-S-k>", "dd", { noremap = true, silent = true })
vim.keymap.set("v", "<A-S-k>", ":d<cr>", { noremap = true, silent = true })

-- Move line up/down (Alt+Up/Down, same as VSCode)
vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<cr>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<cr>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })

-- Indent/Outdent (Alt+] / Alt+[, like Cmd+] / Cmd+[)
vim.keymap.set("n", "<A-]>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-[>", "<<", { noremap = true, silent = true })
vim.keymap.set("v", "<A-]>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-[>", "<gv", { noremap = true, silent = true })

-- Find in file (Alt+f is Zen Mode, so use leader)
-- Alt+Shift+f → search across files (like Cmd+Shift+F)
vim.keymap.set("n", "Ï", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })

-- Go to line (Alt+g, like Cmd+G)
vim.keymap.set("n", "©", ":", { noremap = true })

-- Select all (Alt+a, like Cmd+A)
vim.keymap.set("n", "å", "ggVG", { noremap = true, silent = true })

-- Save all (Alt+Shift+s)
vim.keymap.set("n", "Í", "<cmd>wa<cr>", { noremap = true, silent = true })

-- Insert line below (Alt+Enter, like Cmd+Enter)
vim.keymap.set("n", "<A-CR>", "o<Esc>", { noremap = true, silent = true })

-- Window navigation (Ctrl+h/j/k/l)
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Buffer navigation (Shift+h/l, like tab switching)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { noremap = true, silent = true })
