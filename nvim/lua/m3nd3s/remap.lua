vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-l>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-k>", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "./", vim.cmd.nohlsearch)
