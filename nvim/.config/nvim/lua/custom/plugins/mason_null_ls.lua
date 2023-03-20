return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  opts = {
    ensure_installed = { "stylua", "prettierd", "goimports" },
    automatic_installation = false,
    automatic_setup = true,
  },
  config = function(_, opts)
    require("mason-null-ls").setup(opts)
    require("mason-null-ls").setup_handlers()
  end,
}
