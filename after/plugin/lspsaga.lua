local saga = require("lspsaga")

-- saga diagnostic_jump_next
vim.keymap.set("n", "<C-j>", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
-- sag hover_doc
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", { silent = true })
-- saga signature_help
vim.keymap.set("i", "<C-k>", ":Lspsaga signature_help<CR>", { silent = true })
-- saga lsp_finder
vim.keymap.set("n", "gh", ":Lspsaga lsp_finder<CR>", { silent = true })
