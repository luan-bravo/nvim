-- greatest remap ever
vim.keymap.set("n", "<leader><C-Y>", [[ggVG"+y:q]],
	{ desc = "Copy buffer to cliboard and quit", remap = true })
-- greatest remap ever:
vim.keymap.set("v", "<leader><C-Y>", [[<esc><leader><C-Y>]],
	{ desc = "Copy buffer to cliboard and quit", remap = false })

-- next greatest remap ever : ThePrimeagen : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank from cursor to end of  line to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>c", [["+c]], { desc = "Cut to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>C", [["+C]], { desc = "Cut to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]], { desc = "Delete to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>D", [["+D]], { desc = "Delete to void" })

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+p]], { desc = "Paste from clipboard" })

vim.keymap.set("v", "<leader>dp", [["_dP]], { desc = "Delete to void and Paste" })
