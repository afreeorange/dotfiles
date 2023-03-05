-- https://github.com/lewis6991/gitsigns.nvim#usage

local Plugin = { 'lewis6991/gitsigns.nvim' }

Plugin.name = "gitsigns"

Plugin.opts = {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = 'x' },
    topdelete    = { text = '^' },
    changedelete = { text = '~' },
    untracked    = { text = '?' },
  }
}

return Plugin
