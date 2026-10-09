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

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Atalho exclusivo para buffers de Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.keymap.set("n", "<leader>mo", function()
      local current_file = vim.fn.expand("%:p")
      if current_file ~= "" then
        vim.fn.jobstart({ "marktext", current_file }, { detach = true })
        vim.notify("Abrindo no MarkText...", vim.log.levels.INFO)
      end
    end, { buffer = true, desc = "Abrir Markdown no MarkText" })
  end,
})
