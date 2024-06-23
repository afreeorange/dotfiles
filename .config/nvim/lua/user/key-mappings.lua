-- =========== KEY-MAPPINGS ========== --

vim.keymap.set("n", "<leader>ev", "<cmd>vsplit $MYVIMRC<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", { noremap = true, silent = true })

-- Tab movement
vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", "<cmd>tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", "<cmd>tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", "<cmd>tabclose<CR>", { noremap = true, silent = true })

if jit.os == "OSX" then
  vim.keymap.set("n", "Ω", "<cmd>set wrap!<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "¬", "<cmd>set nonumber!<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "œ", "<cmd>qa!<cr>", { noremap = true, silent = true })
end
