for _, source in ipairs {
  "user.options",
  "user.commands",
  "user.key-mappings",
  "user.plugin-loader"
} do
    local ok, fault = pcall(require, source)

    if not ok then
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
end

-- Enable syntax highlighting in fenced code blocks. Works with Treesitter.
vim.g.markdown_fenced_languages = {
  "bash",
  "css",
  "javascript",
  "lua",
  "python",
  "scss",
  "sql",
  "typescript",
}

-- Set the color scheme here. It's a bit messy doing this via Lazy.vim
pcall(vim.cmd.colorscheme, 'tokyonight-storm')
