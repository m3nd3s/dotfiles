-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', version = '0.2.2',
    requires = { 
      {'nvim-lua/plenary.nvim'},
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    }
  }

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }

  use('nvim-treesitter/nvim-treesitter', { branch = 'main', run = ':TSUpdate'})
  use('neovim/nvim-lspconfig', { tag = 'v1.8.0', pin = true })
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use { "almo7aya/openingh.nvim" }
  -- use {
  --   'juacker/git-link.nvim',
  --   config = function()
  --     -- Set up your keymaps
  --     vim.keymap.set('n', '<leader>gu', function() require("git-link.main").copy_line_url() end)
  --     vim.keymap.set('n', '<leader>go', function() require("git-link.main").open_line_url() end)
  --     vim.keymap.set('x', '<leader>gu', function() require("git-link.main").copy_line_url() end)
  --     vim.keymap.set('x', '<leader>go', function() require("git-link.main").open_line_url() end)
  --   end
  -- }

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

  use 'rcarriga/nvim-notify'

  use { "catppuccin/nvim", as = "catppuccin" }

  use "m4xshen/smartcolumn.nvim"

  use { 
    'alvarosevilla95/luatab.nvim', 
    requires = 'nvim-tree/nvim-web-devicons' 
  }

  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  use {
    "ellisonleao/glow.nvim", 
    config = function() 
      require("glow").setup() 
    end
  }

  use { "kassio/neoterm" }

  use {
    'ms-jpq/coq_nvim', 
    branch = 'coq',
    event = "InsertEnter",
    opt = true,
    run = ":COQdeps",
    requires = {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts'}
    },
    disable = false,
  }

  use {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    config = function()
      require("codediff").setup()
    end
  }

  use {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end
  }

  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status

end)
