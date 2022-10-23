local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  use { "catppuccin/nvim", as = "catpuccin" }
  use { "rktjmp/lush.nvim" }

  use { "tpope/vim-repeat" }
  use { "tpope/vim-surround" }
  use { "justinmk/vim-sneak" }
  use { "justinmk/vim-dirvish" }
  use { "christoomey/vim-tmux-runner" }
  use { "christoomey/vim-tmux-navigator" }
  use { "numToStr/Comment.nvim" }
  use { "folke/todo-comments.nvim" }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "andymass/vim-matchup",
      { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
      { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
      { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
      { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
    },
  }

  use { "lukas-reineke/indent-blankline.nvim" }

  use { "lewis6991/gitsigns.nvim" }

  use { "junegunn/vim-easy-align" }

  use {
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "onsails/lspkind-nvim",
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  use { "jose-elias-alvarez/null-ls.nvim" }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
      "petertriho/cmp-git",
    },
  }

  use {
    "L3MON4D3/LuaSnip",
    requires = {
      "rafamadriz/friendly-snippets",
      after = "LuaSnip",
    },
  }

  use { 'xiyaowong/nvim-transparent' }
  use { 'lewis6991/impatient.nvim' }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
