local Plugin = { 'lukas-reineke/indent-blankline.nvim' }

Plugin.name = "indent-blankline"

Plugin.opts = {
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false
}

return Plugin
