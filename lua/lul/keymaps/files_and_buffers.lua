local function silent(c) vim.cmd("silent "..c) end

local function write_if_not_readonly(cmd)
	if vim.bo.readonly then
		vim.notify("Read Only!", vim.log.levels.WARN)
	else
		silent(cmd)
	end
end

vim.keymap.set("n", "<leader>w", function() write_if_not_readonly("w") end,
	{ desc = "Write" })
vim.keymap.set("n", "<leader>W", function() write_if_not_readonly("wall") end,
	{ desc = "Write All" })

vim.keymap.set("n", "<leader>q", function() silent("quit") end,
	{ desc = "Quit" })
vim.keymap.set("n", "<leader>Q", function() silent("quit!") end,
	{ desc = "Quit!" })
vim.keymap.set("n", "<C-q>", function() silent("quitall!") end,
	{ desc = "Quit!" })

vim.keymap.set("n", "<leader>x", function() silent("bdelete") end,
	{ desc = "Buffer Delete" })
vim.keymap.set("n", "<leader>X", function() silent("bdelete!") end,
	{ desc = "Buffer Delete!" })
vim.keymap.set("n", "<leader>h", function() silent("bprevious") end,
	{ desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>l", function() silent("bnext") end,
	{ desc = "Buffer Next" })
