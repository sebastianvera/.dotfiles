-- Global options
vim.o.encoding      = 'UTF-8'
vim.o.smartindent   = true
vim.o.rnu           = true
vim.o.number        = true
vim.o.cursorline    = true
vim.o.autowrite     = true
vim.o.backup        = false
vim.o.completeopt   = 'menuone,noselect'
vim.o.foldenable    = false
vim.o.hidden        = true
vim.o.ignorecase    = true
vim.o.inccommand    = 'nosplit'
vim.o.incsearch     = true
vim.o.lazyredraw    = true
vim.o.mouse         = 'a'
vim.o.scrolloff     = 8
vim.o.sidescroll    = 5
vim.o.shiftwidth    = 2
vim.o.tabstop       = 2
vim.o.expandtab     = true
vim.o.showmode      = false
vim.o.showmatch     = true
vim.o.showtabline   = 1
vim.o.signcolumn    = 'yes'
vim.o.spelllang     = 'en_us'
vim.o.splitbelow    = true
vim.o.splitright    = true
vim.o.swapfile      = false
vim.o.undodir       = "/Users/rope/.vim/undodir"
vim.o.undofile      = true
vim.o.undolevels    = 5000
vim.o.updatetime    = 300
vim.o.wrap          = false
vim.o.writebackup   = false
vim.o.list          = false
vim.o.termguicolors = true
vim.o.laststatus    = 3
vim.opt.listchars   = { space = '·', trail = '·', precedes = '«', extends = '»', eol = '↲', tab = '▸ ' }
vim.opt.suffixes    = vim.opt.suffixes - '.h'
vim.opt.shortmess   = vim.opt.shortmess - 'S'

require("catppuccin").setup({
  transparent_background = false,
})
-- vim.g.catpuccin_flavour = "macchiato"
vim.cmd [[ colorscheme catppuccin ]]
