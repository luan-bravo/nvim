------------------------------
-- Buffer/File Manipulation --
------------------------------
vim.keymap.set("n", "<leader>w", function() vim.cmd("w") end, { desc = "Write" } )
vim.keymap.set("n", "<leader>W", function() vim.cmd("wall") end, { desc = "Write All" })

vim.keymap.set("n", "<leader>q", function() vim.cmd("quit") end, { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", function() vim.cmd("quit!") end, { desc = "Quit!" })
vim.keymap.set("n", "<C-q>", function() vim.cmd("quitall!") end, { desc = "Quit!" })

vim.keymap.set("n", "<leader>x", function() vim.cmd("bdelete") end, { desc = "Buffer Delete" })
vim.keymap.set("n", "<leader>X", function() vim.cmd("bdelete!") end, { desc = "Buffer Delete!" })
vim.keymap.set("n", "<leader>h", function() vim.cmd("bprevious") end, { desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>l", function() vim.cmd("bnext") end, { desc = "Buffer Next" })
