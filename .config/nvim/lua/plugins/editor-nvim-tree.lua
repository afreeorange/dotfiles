-- https://github.com/nvim-tree/nvim-tree.lua

local Plugin = { 'nvim-tree/nvim-tree.lua' }

Plugin.name = "nvim-tree"

Plugin.opts = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",
    indent_markers = {
      enable = false,
    },
  },
}

function Plugin.init()
  vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
end

return Plugin
