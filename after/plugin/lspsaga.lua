local saga = require("lspsaga")

vim.keymap.set("n", "<C-j>", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("i", "<C-k>", ":Lspsaga signature_help<CR>", { silent = true })
vim.keymap.set("n", "gh", ":Lspsaga lsp_finder<CR>", { silent = true })
