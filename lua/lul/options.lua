local M = { }

M.data = vim.fn.stdpath("data")
M.swap_dir = M.data.."/swap"
M.backup_dir = M.data.."/backup"

vim.opt.guicursor:append({
	["n-c"] = "block",
	["i-ci-ve"] = "ver25",
	["v-r-cr"] = "hor20",
	["o"] = "hor50",
})

vim.opt.encoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
-- TODO: make a key binding to show 80th column line only for some seconds
vim.opt.colorcolumn = "80"

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.showbreak = " ↳" -- U+21b3

vim.opt.swapfile = true

vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.backupdir = M.backup_dir .. '//' -- Gemini-2.5-pro: The double slash '//' ensures that files with the same name in different directories don't overwrite each other's backups.

vim.opt.swapfile = true
vim.opt.directory = M.swap_dir .. '//'

vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.list = true
local indent = " "
vim.opt.listchars:append({
	tab = indent,
	leadmultispace = indent,
})
local trail_g = Group("TrailingSpacesChar", { clear = true })
Autocmd("InsertEnter", { group = trail_g, pattern = "*", callback = function()
	vim.opt.listchars:remove("trail")
end})
Autocmd("InsertLeave", { group = trail_g, pattern = "*", callback = function()
	vim.opt.listchars:append({trail = "▒"})
end})

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

vim.opt.shell = (vim.env.SHELL) and vim.env.SHELL.." -i" or nil

vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"
vim.opt.showtabline = 2 -- 0 = never, 1 = #tabs>1, 2 = always

vim.opt.report = 30

vim.opt.completeopt:append({
	"menuone",
	"noselect",
	"popup",
})

return M
