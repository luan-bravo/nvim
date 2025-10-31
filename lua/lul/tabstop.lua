local function set_opts(tabsize)
	vim.opt.tabstop = tabsize
	vim.opt.softtabstop = tabsize
	vim.opt.shiftwidth = tabsize
end
local function set_bo(buf, size)
	vim.bo[buf].tabstop = size
	vim.bo[buf].softtabstop = size
	vim.bo[buf].shiftwidth = size
end

local default_min_size = 2
local default_size = 4

Tab = { }
Tab.default.size = (default_size >= default_min_size) and default_size or default_min_size

function Tab:set(tabsize)
	self.default.size = (tabsize >= default_min_size) and tabsize or default_min_size
	set_opts(self.default.size)
end
function Tab:double()
	self:set(self.default.size * 2)
end
function Tab:half()
	self:set(self.default.size / 2)
end

function Tab:set_buf(tabsize)
	local buf = vim.api.nvim_get_current_buf()
	self[buf].size = (tabsize >= default_min_size) and tabsize or default_min_size
	set_bo(buf, self[buf].size)
end
function Tab:double_buf()
	local buf = vim.api.nvim_get_current_buf()
	self:set_buf(self[buf].size * 2)
end
function Tab:half_buf()
	local buf = vim.api.nvim_get_current_buf()
	self:set_buf(self[buf].size / 2)
end

Tab:set(Tab.size) -- set default tab opts

vim.keymap.set("n", "<leader><tab>", function() Tab:set_buf(Tab.default.size) end, { desc = "Set (soft)tabstop,shiftwirdth=4" })
vim.keymap.set("n", "<leader><leader><tab>", function() Tab:set(default_size) end, { desc = "Set (soft)tabstop,shiftwirdth=4" })

vim.keymap.set("n", "<leader>>", function() Tab:double_buf() end, { desc = "Double Tab Size" })
vim.keymap.set("n", "<leader><", function() Tab:half_buf() end, { desc = "Half Tab Size" })

vim.keymap.set("n", "<leader><leader>>", function() Tab:double() end, { desc = "Double Tab Size" })
vim.keymap.set("n", "<leader><leader><", function() Tab:half() end, { desc = "Half Tab Size" })
