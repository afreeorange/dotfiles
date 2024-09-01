-- The default. Rather nice.
-- https://github.com/goolord/alpha-nvim/blob/main/lua/alpha/themes/startify.lua
-- require 'alpha'.setup(require 'alpha.themes.startify'.config)
-- https://github.com/NvChad/NvChad/blob/main/lua/plugins/configs/alpha.lua
-- https://github.com/goolord/alpha-nvim/discussions/16
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-4803194
-- https://github.com/AllanChain/custom-chad/blob/main/plugins/alpha.lua
--
--
-----------------------------------------------------------------------------
local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 1,
        width = 45,
        align_shortcut = "right",
        hl = "AlphaButtons"
    }

    if keybind then
        opts.keymap = {"n", sc_, keybind, {
            noremap = true,
            silent = true
        }}
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts
    }
end

local function header_hl_today()
    local wday = os.date("*t").wday
    local colors = {"Keyword", "Constant", "Number", "Type", "String", "Special", "Function"}
    return colors[wday]
end

-----------------------------------------------------------------------------

return {
    'goolord/alpha-nvim',
    name = "alpha",
    opts = {
        layout = {{
            type = "padding",
            val = 4
        }, {
            type = "text",
            val = {"██╗  ██╗███████╗██╗     ██╗      ██████╗     ",
                   "██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ",
                   "███████║█████╗  ██║     ██║     ██║   ██║    ",
                   "██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ",
                   "██║  ██║███████╗███████╗███████╗╚██████╔╝    ",
                   "╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝     ",
                   "",
                   "███╗   ██╗██╗██╗  ██╗██╗  ██╗██╗██╗          ",
                   "████╗  ██║██║██║ ██╔╝██║  ██║██║██║          ",
                   "██╔██╗ ██║██║█████╔╝ ███████║██║██║          ",
                   "██║╚██╗██║██║██╔═██╗ ██╔══██║██║██║          ",
                   "██║ ╚████║██║██║  ██╗██║  ██║██║███████╗██╗  ",
                   "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝"},
            opts = {
                position = "center",
                hl = header_hl_today()
            }
        }, {
            type = "padding",
            val = 5
        }, {
            type = "group",
            val = {button("<leader> f f", "Find File", ":Telescope find_files<CR>"),
                   button("<leader> f g", "Find Word", ":Telescope live_grep<CR>"),
                   button("<leader> f o", "Recent", ":Telescope oldfiles<CR>"),
                   button("<leader> e s", "Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
                   button("<leader> b m", "Bookmarks", ":Telescope marks<CR>")},
            opts = {
                spacing = 0
            }
        }}
    }
}
