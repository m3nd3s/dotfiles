-- after/plugin/matchup.lua

-- Configurações globais do vim-matchup
vim.g.matchup_matchparen_offscreen = { method = "popup" }

-- Melhora a performance: desativa o delay para destacar o par/bloco correspondente
vim.g.matchup_matchparen_deferred = 1

-- Se você usa nvim-treesitter, avisa o módulo para integrar com o matchup
local status_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if status_treesitter then
  treesitter.setup({
    matchup = {
      enable = true, -- Ativa a integração do treesitter com o matchup
    },
  })
end
