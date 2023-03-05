-- https://github.com/nvim-treesitter/nvim-treesitter#quickstart

local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.name = "nvim-treesitter"

Plugin.opts = {
  ensure_installed = {
    "bash",
    "css",
    "go",
    "javascript",
    "tsx",
    "typescript",
    "python",
    "lua",
    "scss",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
}

return Plugin
