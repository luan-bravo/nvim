vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.opt.showtabline = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = " ↳" -- \u21b3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.list = true
-- vim.opt.listchars:append("space:⠂") -- \uec07
vim.opt.listchars:append("eol:") -- \ue621

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.foldopen = "mark,percent,quickfix,search,tag,undo"
vim.opt.ignorecase = true

if vim.fn.getenv("SHELL") then
    vim.env.shell = vim.fn.getenv("SHELL")
    vim.opt.shell = vim.env.shell .. " -i" -- Sets shell to default user shell and logs in (zsh)
end

vim.opt.showmode = true
vim.opt.showcmd = true

vim.opt.report = 30

