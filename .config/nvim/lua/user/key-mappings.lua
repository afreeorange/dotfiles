-- References
-- https://github.com/bugb/dotfiles/blob/main/.config/nvim/core/options.lua

vim.keymap.set("n", "<leader>ep", "<cmd>e $MYVIMRC<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qs", "<cmd>wqa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", "<cmd>tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", "<cmd>tabnext<CR>", { noremap = true, silent = true })
-- TODO: Tab close...?

if jit.os == "OSX" then
  vim.keymap.set("n", "Ω", "<cmd>set wrap!<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "¬", "<cmd>set nonumber!<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "œ", "<cmd>q<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "ß", "<cmd>w<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "∂", "mzyyp`z", { noremap = true, silent = true })
end
