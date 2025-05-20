-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'binhtran432k/dracula.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'nvim-treesitter/playground'
  use 'folke/tokyonight.nvim'
  use('neovim/nvim-lspconfig', { tag = 'v1.8.0', pin = true })
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'juacker/git-link.nvim',
    config = function()
      -- Set up your keymaps
      vim.keymap.set('n', '<leader>gu', function() require("git-link.main").copy_line_url() end)
      vim.keymap.set('n', '<leader>go', function() require("git-link.main").open_line_url() end)
      vim.keymap.set('x', '<leader>gu', function() require("git-link.main").copy_line_url() end)
      vim.keymap.set('x', '<leader>go', function() require("git-link.main").open_line_url() end)
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use "tpope/vim-rails"

end)
