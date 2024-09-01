-- https://github.com/norcalli/nvim-colorizer.lua

local Plugin = { 'norcalli/nvim-colorizer.lua' }

Plugin.name = "colorizer"
Plugin.event = 'VeryLazy'

function Plugin.init()
  require("colorizer").setup()
end

return Plugin
