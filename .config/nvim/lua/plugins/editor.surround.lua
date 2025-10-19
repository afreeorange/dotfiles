-- https://github.com/nvim-mini/mini.surround
--
local Plugin = {"echasnovski/mini.surround"}

Plugin.opts = {
    -- https://github.com/nvim-mini/mini.surround?tab=readme-ov-file#default-config
}

function Plugin.config()
    require('mini.surround').setup()
end

return Plugin
