---Default tab size
local tab = {
	default = {
		size = 4, min_size = 2
	},
}
assert(tab.default.min_size < tab.default.size, { message = "Default minimum tabstop size is bigger than default size" })

function tab.set_opts(tabstop)
	vim.opt.tabstop = tabstop
	vim.opt.softtabstop = tabstop
	vim.opt.shiftwidth = tabstop
end
function tab:set(tabstop)
	self.default.size = (tabstop >= self.default.min_size)
		and tabstop
		or self.default.min_size
	self.set_opts(self.default.size)
end
function tab:double()
	self:set(self.default.size * 2)
end
function tab:half()
	self:set(self.default.size / 2)
end

-- function tab:set_buf_opts(buf, size)
-- 	self[buf] = { size =  self.default.size, }
-- 	vim.bo[buf].tabstop = size
-- 	vim.bo[buf].softtabstop = size
-- 	vim.bo[buf].shiftwidth = size
-- end
-- function tab:set_buf(tabstop)
-- 	local buf = vim.api.nvim_get_current_buf()
-- 	self[buf].size = (tabstop >= self.default.min_size)
-- 		and tabstop
-- 		or self.default.min_size
-- 	self:set_buf_opts(buf, self[buf].size)
-- end
-- function tab:double_buf()
-- 	local buf = vim.api.nvim_get_current_buf()
-- 	self:set_buf(self[buf].size * 2)
-- end
-- function tab:half_buf()
-- 	local buf = vim.api.nvim_get_current_buf()
-- 	self:set_buf(self[buf].size / 2)
-- end


vim.keymap.set("n", "<leader>>", function() tab:double() end,
	{ desc = "Double tab Size" })
vim.keymap.set("n", "<leader><", function() tab:half() end,
	{ desc = "Half tab Size" })

-- vim.keymap.set("n", "<leader><tab>", function() tab:set_buf(tab.default.size) end,
-- 	{ desc = "Set (soft)tabstop, shiftwirdth to buffer default" })
-- vim.keymap.set("n", "<leader>>", function() tab:double_buf() end,
-- 	{ desc = "Double tab Size" })
-- vim.keymap.set("n", "<leader><", function() tab:half_buf() end,
-- 	{ desc = "Half tab Size" })


tab:set(tab.default.size)
vim.opt.expandtab = false

return tab
