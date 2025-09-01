---------------
-- Clipboard --
---------------
vim.keymap.set({ "n", "v" }, "<leader>P", [["+p]], { desc = "Paste from clipboard" })
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank from cursor to end of  line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>D", [["_d]], { desc = "Delete to void" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]], { desc = "Delete to clipboard" })
-- greatest remap ever
vim.keymap.set("x", "<leader>dp", [["_dP]], { desc = "Delete to void and Paste" })
vim.keymap.set("v", "<leader><C-Y>", [[ggVG"+y:q]], { desc = "Copy buffer to cliboard and quit", noremap = true })
