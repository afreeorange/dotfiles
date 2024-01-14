-- Gruvbox <3
-- https://github.com/ellisonleao/gruvbox.nvim#configuration

-- local Plugin = { "ellisonleao/gruvbox.nvim" }
-- Plugin.name = "gruvbox"
-- function Plugin.init()
--   vim.opt.background = "dark"
--   require("gruvbox").load()
-- end

------------------------------------------------------------------------------

-- OneDark
-- https://github.com/navarasu/onedark.nvim#default-configuration

local Plugin = { "navarasu/onedark.nvim" }
Plugin.name = "onedark"
Plugin.opts = {
  style = "darker",
}

function Plugin.init()
  -- require("onedark").load()
  -- vim.cmd.colorscheme("tokyonight-storm")
  vim.cmd.colorscheme("ayu")
end

return Plugin
