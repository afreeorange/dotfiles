-- https://github.com/navarasu/onedark.nvim#default-configuration

local Plugin = { "navarasu/onedark.nvim" }

Plugin.name = "onedark"

Plugin.opts = {
  style = "darker",
}

function Plugin.init()
  require("onedark").load()
  -- vim.cmd.colorscheme("tokyonight-storm")
end

return Plugin
