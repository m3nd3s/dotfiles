local status, gitsigns = pcall(require, "gitsigns")
if not status then return end

gitsigns.setup({
  current_line_blame = true, -- Mostra quem fez o commit daquela linha em texto fantasma (estilo GitLens)
})

-- Atalho para ver o que mudou na linha atual (Preview Hunk)
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "Preview da alteração na linha" })
