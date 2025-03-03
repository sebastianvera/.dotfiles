return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  dependencies = {
    "andymass/vim-matchup",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
  },
  opts = {
    ensure_installed = {
      "go",
      "html",
      "javascript",
      "markdown",
      "query",
      "rust",
      "tsx",
      "typescript",
      "lua",
      "fish",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    require("nvim-ts-autotag").setup()
  end,
}
