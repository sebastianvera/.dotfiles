return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local lackluster = require("lackluster")
    lackluster.setup({
      tweak_background = {
        normal = "none",
        telescope = "none",
        menu = "none",
        popup = "none",
      },
    })
    vim.cmd.colorscheme("lackluster")
    -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
}
