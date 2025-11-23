-- Globals
vim.g.mapleader = " "

-- Require modules
local modules = {
	"options",
	"autocmd",
	"functions",
	"tabstop",
	"keymaps.keymaps",
	"lazy",
	"clipboard",
}

require("lul.globals")

for _, module in ipairs(modules) do
	local _ = PRequire("lul."..module)
end
