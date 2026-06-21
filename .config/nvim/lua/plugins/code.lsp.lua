-- Neovim 0.12+ has a native LSP client with vim.lsp.enable().
-- mason.nvim installs servers, nvim-lspconfig provides default configs.
--
-- Install servers with :Mason, then add the lspconfig name here.
-- Only servers found on $PATH or in Mason's bin dir will be enabled.

local servers = {
  "bashls",
  "cssls",
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  "ts_ls",
  "yamlls",
}

return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function(_, opts)
      require("mason").setup(opts)
      -- Add Mason bin to PATH so vim.lsp.enable() finds installed servers
      vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
    end,
  },
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
