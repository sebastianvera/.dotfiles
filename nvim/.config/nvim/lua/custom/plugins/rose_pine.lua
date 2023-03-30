return {
  "rose-pine/neovim",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    highlight_groups = {
      MatchParen = { bold = true },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd([[colorscheme rose-pine]])
  end,
}
