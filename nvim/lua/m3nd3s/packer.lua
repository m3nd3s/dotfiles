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

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'nvim-treesitter/playground'
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

  use({
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
    tag = "v2.*"
  })

  use {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use 'rcarriga/nvim-notify'

  use { "catppuccin/nvim", as = "catppuccin" }

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec"),
        }
      })
    end
  }

  use "m4xshen/smartcolumn.nvim"

  use { 'alvarosevilla95/luatab.nvim', requires='nvim-tree/nvim-web-devicons' }

  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  -- use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  -- use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  -- use 'romgrk/barbar.nvim'
end)
