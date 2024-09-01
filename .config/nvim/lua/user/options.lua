-- Enable line numbers
vim.opt.number = true

-- Ignore case during a search
vim.opt.ignorecase = true

-- Now ignore case unless a search term has an uppercase char!
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Indentation behaviour
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Highlight the line I'm on
vim.opt.cursorline = false

-- Show a ruler at various widths
vim.opt.colorcolumn = {79, 100, 120}

-- If the terminal supports it, enable mouse support in all ("a") modes
vim.opt.mouse = 'a'

-- Save undo history
vim.opt.undofile = true

-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- Keep signcolumn on by default. I with with files that are in git repos 90%+
-- of the time
vim.opt.signcolumn = 'yes'

-- Some pre-configuration for theming
vim.opt.termguicolors = true
vim.opt.background = "dark" -- or "light" for light mode

-- Change to the current directory
vim.opt.autochdir = true
