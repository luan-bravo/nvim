--------------
-- Easy SEd --
--------------

vim.keymap.set("v", "<leader>r", [[y:%s/\C<C-r>"//gcI<Left><Left><Left><Left>]], { desc = "Replace selection in file" })
vim.keymap.set("v", "<leader>R", [[y:%s/\C<C-r>"//gI<Left><Left><Left>]], { desc = "Replace selection in line" })

vim.keymap.set("n", "<leader>r", [[viwy:%s/\C\<<C-r>"\>//gcI<Left><Left><Left><Left>]], { desc = "Replace <cWORD> in file" })
vim.keymap.set("n", "<leader>R", [[viWy:%s/\C<C-r>"//gI<Left><Left><Left>]], { desc = "Replace <cword> in line" })
