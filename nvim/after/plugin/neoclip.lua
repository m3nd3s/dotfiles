-- Este arquivo roda AUTOMATICAMENTE após os plugins carregarem.
local status_neoclip, neoclip = pcall(require, "neoclip")
if not status_neoclip then return end 

local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then return end 

-- Configuração com carregamento tardio (Lazy Load) dos módulos de ação
neoclip.setup({
  history = 100,
  enable_persistent_history = false,
  continuation_change_history = false,
  mappings = {
    telescope = {
      i = {
        -- O uso do function() impede o erro de módulo ausente no boot!
        ['<cr>'] = function() require('neoclip.actions').paste_behind() end,
        ['<c-p>'] = function() require('neoclip.actions').paste_before() end,
        ['<c-y>'] = function() require('neoclip.actions').set_reg() end,
      },
      n = {
        ['<cr>'] = function() require('neoclip.actions').paste_behind() end,
        ['<c-p>'] = function() require('neoclip.actions').paste_before() end,
        ['<c-y>'] = function() require('neoclip.actions').set_reg() end,
      },
    },
  },
})

-- Ativa a extensão no Telescope
telescope.load_extension('neoclip')
