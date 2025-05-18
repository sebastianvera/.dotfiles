-- Mappings --
vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true, silent = true, nowait = true })

-- vim.keymap.set("c", "Q", "q", {})
-- vim.keymap.set("c", "W", "w", {})

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

vim.keymap.set("n", "<leader>vi", ":e ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true, nowait = true })

-- Vim Sneak
-- vim.keymap.set("", "f", "<Plug>Sneak_f", { silent = true })
-- vim.keymap.set("", "F", "<Plug>Sneak_F", { silent = true })
-- vim.keymap.set("", "t", "<Plug>Sneak_t", { silent = true })
-- vim.keymap.set("", "T", "<Plug>Sneak_T", { silent = true })


vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, {desc="Open diagnostic in float"})

-- VimTmuxRunner
vim.keymap.set("n", "<Leader>sf", ":VtrSendFile<CR>", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<Leader>or", ":VtrOpenRunner<CR>", { noremap = true, silent = true, nowait = true })
