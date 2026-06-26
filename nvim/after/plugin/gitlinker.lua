local status, gitlinker = pcall(require, "gitlinker")
if not status then return end

gitlinker.setup({
  opts = {
    -- "user_id" se mantém como string padrão da API antiga
    remote = nil,
    -- Adiciona automaticamente o link na sua área de transferência (Ctrl+V / Cmd+V)
    add_to_clipboard = true,
    -- Abre automaticamente o link no seu navegador padrão logo após gerar
    action_callback = require("gitlinker.actions").open_in_browser,
  },
})

-- Mapeamentos de Teclado Rápidos (Formato API Lua)
local opts = { noremap = true, silent = true }

-- <leader>go no Modo Normal: Abre a linha atual (ou arquivo) no GitHub
vim.api.nvim_set_keymap('n', '<leader>go', '<cmd>lua require"gitlinker".get_buf_range_url("n")<CR>', opts)

-- <leader>go no Modo Visual: Selecione as linhas e abra o bloco exato no GitHub
vim.api.nvim_set_keymap('v', '<leader>go', '<cmd>lua require"gitlinker".get_buf_range_url("v")<CR>', opts)
