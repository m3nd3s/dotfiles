-- require('lualine').setup({
--   options = { 
--     -- theme = 'material',
--     -- theme = "papercolor_light",
--     theme = "horizon",
--     icons_enabled = true
--   }
-- })
require('lualine').setup({
  options = {
    theme = "auto",
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = { "NvimTree" }, -- Esconde a barra dentro da nvim-tree para não poluir visualmente
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        symbols = { added = ' ', modified = '󰏬 ', removed = ' ' }, -- Ícones bonitos para o Git
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true,      -- Mostra se o arquivo foi modificado/está readonly
        path = 1,                -- 1 mostra o caminho relativo (ex: app/models/user.rb), excelente para Rails!
      }
    },
    lualine_x = {
      {
        'diagnostics',           -- Captura em tempo real os erros do ruby-lsp / javascript
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' },
      },
      'encoding',
      'filetype'
    },
    lualine_y = {
      -- Exibe o status do COQ v2 na barra para confirmar que ele está ativo no arquivo
      { function() return vim.fn['coq#statusline']() end }
    },
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
})
