--------------
-- Easy SEd --
--------------
vim.keymap.set("v", "<leader>r", [[y:s/<C-r>"//g<Left><Left>]], { desc = "Replace selection in lines", noremap = true })
vim.keymap.set("v", "<leader>R", [[y:%s/<C-r>"//g<Left><Left>]], { desc = "Replace selection in file", noremap = true })
