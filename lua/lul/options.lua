vim.g.mapleader = " "

-- Cursor
vim.opt.guicursor:append({
	"n-c:block",
	"i-ci-ve:ver25",
	"v-r-cr:hor20",
	"o:hor50",
})

-- Columns
vim.opt.showtabline = 1

vim.opt.number = true
vim.opt.relativenumber = true

TABSIZE = 4
vim.opt.tabstop = TABSIZE
vim.opt.softtabstop = TABSIZE
vim.opt.shiftwidth = TABSIZE
vim.opt.expandtab = false
vim.opt.signcolumn = "yes"

-- TODO: make a key binding to show 80th column line only for some seconds
vim.opt.colorcolumn = "80"

vim.opt.encoding = "utf-8"

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.showbreak = " ↳" -- \u21b3

vim.opt.swapfile = false
-- TODO: Find more about this
-- vim.opt.backup = false
-- TODO: move undodir to a better
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.list = true
vim.opt.listchars:append("tab: ")
vim.opt.listchars:append("trail:▒")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.foldopen:append({
	"mark",
	"percent",
	"quickfix",
	"search",
	"tag",
	"undo",
})
vim.opt.smartcase = true

vim.opt.shell = (vim.env.SHELL) and vim.env.SHELL.." -i" or nil

vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"

vim.opt.report = 30

