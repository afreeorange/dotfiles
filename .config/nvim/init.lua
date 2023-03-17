for _, source in ipairs {
  "user.options",
  "user.commands",
  "user.key-mappings",
  "user.plugin-loader",
} do
  local ok, fault = pcall(require, source)
  if not ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

-- =========== REFERENCES ========== --

-- Nerd Fonts
-- https://www.nerdfonts.com/cheat-sheet

-- Build your first Neovim configuration in lua
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/

-- Setup nvim-lspconfig + nvim-cmp
-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/

-- NeoVim starter. Excellent stuff.
-- https://github.com/VonHeikemen/nvim-starter/

-- Kick start template
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- Getting Started with Neovim
-- https://bryankegley.me/posts/nvim-getting-started/

-- Possible plugins
-- https://github.com/moll/vim-bbye

-- AstronVim
-- https://github.com/AstroNvim/AstroNvim/blob/main/init.lua

