-- Neovim 0.12+ has a native LSP client with vim.lsp.enable().
-- mason.nvim installs servers, nvim-lspconfig provides default configs.
-- Use :Mason to install/manage LSP servers.

local servers = {
  "bashls",
  "biome",
  "cssls",
  "emmet_language_server",
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  "rust_analyzer",
  "tailwindcss",
  "ts_ls",
  "vimls",
  "yamlls",
}

return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
