local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    return {
      ensure_installed = {
        "prettierd", "goimports", "fish_indent", "stylua",
      },
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    }
  end,
}
