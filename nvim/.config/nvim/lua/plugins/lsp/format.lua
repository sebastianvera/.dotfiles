-- Hijacked from: https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/plugins/autoformat.lua

-- Create an augroup that is used for managing our formatting autocmds.
--      We need one augroup per client to make sure that multiple clients
--      can attach to the same buffer without interfering with each other.
local _augroups = {}
local get_augroup = function(client)
  if not _augroups[client.id] then
    local group_name = 'lsp-format-' .. client.name
    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
    _augroups[client.id] = id
  end

  return _augroups[client.id]
end

local M = {}

M.on_attach = function(client, bufnr)
  -- Only attach to clients that support document formatting
  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  -- Tsserver usually works poorly. Sorry you work with bad languages
  -- You can remove this line if you know what you're doing :)
  if client.name == 'tsserver' then
    return
  end

  -- Create an autocmd that will run *before* we save the buffer.
  --  Run the formatting command for the LSP that has just attached.
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = get_augroup(client),
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format {
        async = false,
        filter = function(c)
          return c.id == client.id
        end,
      }
    end,
  })
end

return M
