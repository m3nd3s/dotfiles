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

  use { "AckslD/nvim-neoclip.lua" }

  use('nvim-treesitter/nvim-treesitter', { branch = 'main', run = ':TSUpdate'})
  use { 'neovim/nvim-lspconfig' }
  use({ "ms-jpq/coq_nvim", branch = "coq" })
  use { "ms-jpq/coq.artifacts", branch = "artifacts" }
  use({ "ms-jpq/coq.thirdparty", branch = "3p", })

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- use { "almo7aya/openingh.nvim" }
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
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

  use { "catppuccin/nvim", as = "catppuccin" }

  use "m4xshen/smartcolumn.nvim"

  -- use { 
  --   'alvarosevilla95/luatab.nvim', 
  --   requires = 'nvim-tree/nvim-web-devicons' 
  -- }
  use { 'nanozuki/tabby.nvim', requires = 'nvim-tree/nvim-web-devicons' }

  use { 'andymass/vim-matchup' }

  use {
    "ellisonleao/glow.nvim", 
    config = function() 
      require("glow").setup() 
    end
  }
  --
  -- Adicione como uma linha independente no seu packer.lua para uso global
  use { 'nvim-tree/nvim-web-devicons' }

  use { 'sindrets/diffview.nvim', requires = 'nvim-tree/nvim-web-devicons' }

  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status

  use({
    "nvimtools/none-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
end)
