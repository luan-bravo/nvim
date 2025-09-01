------------------------------------
-- Non-Basic but Great and Simple --
------------------------------------
vim.keymap.set("v", "J", [[:move '>+1<CR>gv=gv]], { desc = "Move line down", silent = true })
vim.keymap.set("v", "K", [[:move '<-2<CR>gv=gv]], { desc = "Move line up", silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word" })
-- TODO: WTF do these do?
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Cnext" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Cprev" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Lnext" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Lprev" })
