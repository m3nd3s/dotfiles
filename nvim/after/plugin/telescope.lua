local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep string' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope search keymaps' })
vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Telescope open files' })
vim.keymap.set('n', '<leader>of', builtin.oldfiles, { desc = 'Telescope open old files' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope LSP Diagnostics' })

vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = 'Telescope fuzz current buffer' })
-- Abre o Telescope mostrando todo o histórico de yanks (copiados)
vim.keymap.set('n', '<leader>fy', ':Telescope neoclip<CR>', { desc = 'Telescope find yanks' })
--
-- Atalho para buscar TUDO, incluindo as pastas ignoradas (.agents, graphify-out, etc)
vim.keymap.set('n', '<leader>fa', function()
  builtin.find_files({
    no_ignore = true,          -- Ignora o .gitignore
    hidden = true,             -- Mostra arquivos ocultos
    file_ignore_patterns = {}, -- 💡 Limpa os ignores globais temporariamente para esta busca
    prompt_title = "Buscar Tudo (Incluindo Ignorados)",
  })
end, { desc = 'Telescope Find All Files' })

require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!**/graphify-out/*",
      "--glob=!**/.agents/*",
      "--glob=!**/.cursor/*",
    },
    file_ignore_patterns = {
      "^%.cursor/",        -- Ignora .cursor na raiz (escapando o ponto)
      "%.cursor/",         -- Ignora .cursor em subníveis
      "^%.agents/",        -- Ignora .agents na raiz (escapando o ponto)
      "%.agents/",         -- Ignora .agents em subníveis
      "^graphify%-out/",   -- Ignora a pasta na raiz do projeto (escapando o hífen)
      "graphify%-out/",    -- Ignora a pasta em qualquer subnível
      "^node_modules/",    -- Ignora node_modules na raiz
      "node_modules/",     
      "^vendor/",          -- Ignora vendor na raiz (Gems)
      "^tmp/",             -- Ignora temporários do Rails
      "%.ruby%-lsp/",      -- Ignora o cache do Ruby LSP
    }
  },
  pickers = {
    -- Garante que o localizador de arquivos também aplique os filtros acima de forma rígida
    find_files = {
      hidden = true,       -- Se quiser ver arquivos ocultos (como .gitignore), mas ignorando as pastas acima
      no_ignore = false,   -- Garante que ele respeite arquivos de ignore do Git (.gitignore)
    },
    diagnostics = {
      initial_mode = "normal",
    }
  }
})
require('telescope').load_extension('neoclip')
