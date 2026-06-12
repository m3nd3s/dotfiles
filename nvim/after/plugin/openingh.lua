-- for repository page
vim.api.nvim_set_keymap("n", "<Leader>gp", ":OpenInGHRepo <CR>", { silent = true, noremap = true })

-- for current file page
vim.api.nvim_set_keymap("n", "<Leader>go", ":OpenInGHFile <CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>go", ":OpenInGHFileLines <CR>", { silent = true, noremap = true })
