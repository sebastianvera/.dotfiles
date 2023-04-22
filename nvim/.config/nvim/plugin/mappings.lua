-- Mappings --
vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true, silent = true, nowait = true })

vim.keymap.set("c", "Q", "q", {})
vim.keymap.set("c", "W", "w", {})

vim.keymap.set("", "<C-c>", '"+y', { noremap = true, silent = true, nowait = true })

-- Search mappings: these will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })

-- Motion mappings
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
-- Act like D and C
vim.keymap.set("n", "Y", "y$", { noremap = true, silent = true })
-- Do not show stupid q: window
vim.keymap.set("", "q:", ":q", {})

vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })

-- Telescope: File mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fv", function()
  builtin.find_files({ cwd = "~/.config/nvim" })
end, {})

--
vim.keymap.set("n", "<leader>vi", ":e ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true, nowait = true })

-- Vim Sneak
vim.keymap.set("", "f", "<Plug>Sneak_f", { silent = true })
vim.keymap.set("", "F", "<Plug>Sneak_F", { silent = true })
vim.keymap.set("", "t", "<Plug>Sneak_t", { silent = true })
vim.keymap.set("", "T", "<Plug>Sneak_T", { silent = true })

-- VimTmuxRunner
vim.keymap.set("n", "<Leader>sf", ":VtrSendFile<CR>", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<Leader>or", ":VtrOpenRunner<CR>", { noremap = true, silent = true, nowait = true })

-- Luasnip
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)

vim.keymap.set("n", "<leader>sp", "<cmd>LuaSnipEdit<cr>")

-- dap
-- vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
-- vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
-- vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
-- vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
-- vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
-- vim.keymap.set("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- vim.keymap.set("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
-- vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
-- vim.keymap.set("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")
