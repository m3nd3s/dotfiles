vim.diagnostic.config({
  -- Ativa o nome do linter/ferramenta na mensagem de erro
  -- virtual_text = {
  --   source = "always", -- Opções: "always" ou "if_many"
  --   prefix = "■",      -- Um caractere discreto antes do texto do erro
  -- },
  
  -- Também ativa no menu flutuante (quando você coloca o cursor em cima e abre o popup)
  float = {
    source = "always",
    border = "rounded", -- Deixa a janelinha flutuante com bordas arredondadas bonitas
  },
  
  underline = true,
  update_in_insert = false, -- Não fica piscando erro enquanto você está digitando
  severity_sort = true,     -- Ordena para mostrar os erros mais graves primeiro
})


vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
