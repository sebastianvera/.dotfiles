local nmap = require("sebastianvera.keymap").nmap
local nvim_lsp = require("lspconfig")
local configs = require("lsp")

local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })

local autocmd_clear = vim.api.nvim_clear_autocmds
local autocmd = function(args)
  local event = args[1]
  local group = args[2]
  local callback = args[3]

  vim.api.nvim_create_autocmd(event, {
    group = group,
    buffer = args[4],
    callback = function()
      callback()
    end,
    once = args.once,
  })
end

local function buf_nnoremap(opts)
  if opts[3] == nil then
    opts[3] = {}
  end
  opts[3].buffer = 0

  nmap(opts)
end

local on_attach = function(client, bufnr)
  -- -- Turn off document formatting so we don't get a list with 2 options
  -- if client.name == "gopls" or client.name == "sumneko_lua" then
  -- 	client.server_capabilities.document_formatting = false
  -- end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nnoremap { "gd", function() vim.lsp.buf.definition() end }
  buf_nnoremap { "gD", function() vim.lsp.buf.declaration() end }
  buf_nnoremap { "gh", function() vim.lsp.buf.hover() end }
  buf_nnoremap { "gi", function() vim.lsp.buf.implementation() end }
  buf_nnoremap { "gr", function() vim.lsp.buf.references() end }
  buf_nnoremap { "<leader>rn", function() vim.lsp.buf.rename() end }
  buf_nnoremap { "<leader>ca", function() vim.lsp.buf.code_action() end }
  buf_nnoremap { "K", function() vim.lsp.buf.signature_help() end }
  buf_nnoremap { "<Leader>lf", function() vim.lsp.buf.format({ async = true }) end }

  if client.server_capabilities.documentHighlightProvider then
    autocmd_clear({ group = augroup_highlight, buffer = bufnr })
    autocmd({ "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, buffer = bufnr })
    autocmd({ "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, buffer = bufnr })
  end
end

-- Add completion capabilities (completion, snippets)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local config = { on_attach = on_attach, capabilities = capabilities }

-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for more lsp servers
-- Use these servers and default configs
-- Add more servers here
local servers = {
  sumneko_lua = configs.generate_sumneko_config(config),
  jsonls = configs.generate_jsonls_config(config),
  tsserver = {
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      return on_attach(client, bufnr)
    end,
  },
  emmet_ls = { filetypes = { "html", "css", "typescriptreact", "javascriptreact" } },
  "rust_analyzer",
  "gopls",
  -- "notas",
}

-- Setup all servers from servers table
for k, val in pairs(servers) do
  if type(val) == "table" then
    local server = k
    local opts = val
    nvim_lsp[server].setup(vim.tbl_extend("force", config, opts))
  else
    local server = val
    nvim_lsp[server].setup(config)
  end
end
