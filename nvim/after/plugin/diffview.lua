local status, diffview = pcall(require, "diffview")
if not status then return end

diffview.setup({
  enhanced_diff_hl = true, -- Melhora o destaque de sintaxe dentro do diff
})

-- Opções padrão para os mapeamentos (Não remapear e rodar em silêncio no terminal)
local opts = { noremap = true, silent = true }

-- Configuração usando a API nativa do Lua:
-- vim.api.nvim_set_keymap(MODO, ATALHO, COMANDO, OPÇÕES)
vim.api.nvim_set_keymap('n', '<leader>gv', ':DiffviewOpen<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gx', ':DiffviewClose<CR>', opts)
