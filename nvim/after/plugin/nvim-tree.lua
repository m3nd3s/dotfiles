-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
    side = "left"
  },
  renderer = {
    group_empty = false,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true, -- Ativa ícones do Git (indica se o arquivo é novo, modificado, etc.)
      },
    }
  },
  filters = {
    dotfiles = true,
    custom = { "^\\.git$" }, -- Esconde apenas a pasta interna .git para não poluir
  },
  git = {
    enable = true,
    ignore = false, -- Se True, ele esconde os arquivos que estão no .gitignore (como logs ou .env). Queremos vê-los!
  },
  update_focused_file = {
    enable = true, -- O PULO DO GATO: Se você mudar de arquivo usando o Telescope, a nvim-tree foca automaticamente no arquivo aberto!
    update_root = false,
  },
})
