local uv = vim.loop

local handle = nil
local pid = nil

local function run()
  vim.cmd("split")
  local win = vim.api.nvim_get_current_win()
  local bufr = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_win_set_buf(win, bufr)

  local chan = vim.api.nvim_open_term(bufr, {})

  if handle and not handle:is_closing() then
    print("Closing")
    handle:close()
    handle = nil
    pid = nil
  end

  -- vim.fn.jobstart({"echo", "$PATH"}, {
  --   stdout_buffered = true,
  --   on_stdout = function(_, data)
  --     if data then
  --       vim.api.nvim_chan_send(chan, table.concat(data, '\r\n'))
  --     end
  --   end,
  --   on_stderr = function(_, data)
  --     if data then
  --       vim.api.nvim_chan_send(chan, table.concat(data, '\r\n'))
  --     end
  --   end,
  -- })
end

run()
