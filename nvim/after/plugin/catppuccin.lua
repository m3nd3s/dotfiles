require("catppuccin").setup({
  flavour = "mocha", -- sabores disponíveis: latte (claro), frappe, macchiato, mocha (escuro escuro)
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- mude para true se você curte o fundo transparente do seu terminal
  dim_inactive = {
    enabled = true
  },
  show_end_of_buffer = false,     -- esconde aqueles tils (~) que ficam nas linhas vazias no fim do arquivo
  integration_default = false,
  integrations = {
    -- ATIVA AS INTEGRAÇÕES COMPLETAS COM SEUS PLUGINS
    coq = true,             -- Deixa o menu flutuante do COQ v2 integrado perfeitamente
    nvimtree = true,        -- Aplica os tons pastéis do tema nas pastas e arquivos da Nvim-Tree
    telescope = {
      enabled = true,
      style = "nvchad"      -- Dá um design moderno e em blocos limpos para o Telescope
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "undercurl" }, -- Linha ondulada embaixo de erros do ruby-lsp, estilo VS Code
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
})

vim.cmd.colorscheme('catppuccin')
