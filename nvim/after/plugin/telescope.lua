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
      "--smart-case", -- <- O pulo do gato para buscas mais inteligentes
    },
    file_ignore_patterns = {
      "graphify-out/",
      "node_modules/",   -- Ignora pacotes Node
      "vendor/",         -- Opcional: ignora gems vendadas se poluírem a busca
      "tmp/",            -- Ignora arquivos temporários do Rails
      "%.ruby%-lsp/",    -- Ignora o cache do Ruby LSP (usa % para escapar o ponto)
    }
  },
})
require('telescope').load_extension('neoclip')
