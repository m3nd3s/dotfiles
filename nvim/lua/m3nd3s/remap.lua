vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-l>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-k>", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "./", vim.cmd.nohlsearch)


-- Copy current filepath to clipboard
function insertFullPath()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', filepath) -- write to clippoard
end
vim.keymap.set('n', '<leader>cr', insertFullPath, { noremap = true, silent = true })
