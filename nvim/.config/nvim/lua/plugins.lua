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


  -- use {
  --   "folke/trouble.nvim",
  --   requires = "kyazdani42/nvim-web-devicons",
  -- }
  --
  -- use { "jose-elias-alvarez/null-ls.nvim" }
   use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }


  use { 'xiyaowong/nvim-transparent' }
  use { 'lewis6991/impatient.nvim' }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
