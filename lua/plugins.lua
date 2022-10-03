local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'folke/tokyonight.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Install without configuration
  use({ 'projekt0n/github-nvim-theme' })
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'lewis6991/gitsigns.nvim',
  }
  use {
    'p00f/nvim-ts-rainbow'
  }
  use { 'easymotion/vim-easymotion' }
  -- Lua
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use { 'onsails/lspkind-nvim' }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use { 'windwp/nvim-ts-autotag' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use { 'github/copilot.vim' }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'MunifTanjim/prettier.nvim' }
  use 'marko-cerovac/material.nvim'
  -- If you are using Packer
  use 'shaunsingh/nord.nvim'
end)
