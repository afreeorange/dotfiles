-- https://github.com/nvim-treesitter/nvim-treesitter#quickstart

local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.name = "nvim-treesitter"

Plugin.opts = {
  ensure_installed = {
    "bash",
    "css",
    "go",
    "javascript",
    "lua",
    "python",
    "rust",
    "scss",
    "tsx",
    "typescript",
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
