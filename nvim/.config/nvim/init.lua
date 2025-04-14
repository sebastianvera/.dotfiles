vim.g.mapleader = " "
vim.g.maplocalleader = " "

pcall(require, "impatient")

-- Setup enovim providers (`:h provider`)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Disable built-in plugins (`:h standard-plugin-list`)
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

require("globals")

-- Abbreviations --
vim.cmd([[ iab arent       aren't ]])
vim.cmd([[ iab becuase     because ]])
vim.cmd([[ iab behaivor    behavior ]])
vim.cmd([[ iab doesnt      doesn't ]])
vim.cmd([[ iab dont        don't ]])
vim.cmd([[ iab edn         end ]])
vim.cmd([[ iab flase       false ]])
vim.cmd([[ iab funciton    function ]])
vim.cmd([[ iab funciton    function ]])
vim.cmd([[ iab funtcion    function ]])
vim.cmd([[ iab hieght      height ]])
vim.cmd([[ iab isnt        isn't ]])
vim.cmd([[ iab iwth        with ]])
vim.cmd([[ iab lieakwise   likewise ]])
vim.cmd([[ iab liek        like ]])
vim.cmd([[ iab mian        main ]])
vim.cmd([[ iab moer        more ]])
vim.cmd([[ iab opne        open ]])
vim.cmd([[ iab previosu    previous ]])
vim.cmd([[ iab pritn       print ]])
vim.cmd([[ iab retrun      return ]])
vim.cmd([[ iab tihs        this ]])
vim.cmd([[ iab succesfully successfully ]])
vim.cmd([[ iab whit        with ]])
vim.cmd([[ iab wieght      weight ]])
vim.cmd([[ iab wiht        with ]])
vim.cmd([[ iab wont        won't ]])

vim.cmd([[ iab <expr> timets strftime("%T") ]])
vim.cmd([[ iab <expr> datets strftime("%F") ]])

vim.cmd([[
  augroup MarkdownGroup
  autocmd!
  au filetype markdown lua vim.opt_local.spell = true
  augroup end
]])

vim.cmd([[
  augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})
  augroup END
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", { dev = { path = "~/Code" } })
