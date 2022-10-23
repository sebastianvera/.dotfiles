require("null-ls").setup({
  -- debug = true,
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.formatting.goimports,
    -- require("null-ls").builtins.diagnostics.golangci_lint,
    -- require("null-ls").builtins.code_actions.gitsigns,
  },
})
