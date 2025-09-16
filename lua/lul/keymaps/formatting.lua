----------------
-- Formatting --
----------------
vim.keymap.set("n", "<leader>=", [[mzggVG=`z]], { silent = true, desc = "Format current buffer's indentation" })

vim.keymap.set("n", "<Leader>.<tab>", function ()
    NonLspIndent()
end, { noremap = true, silent = true, desc = "Retab file from 4-space width to 8-space width tabs" })


vim.keymap.set('n', '<leader>.<tab>', [[%s/^\s\+/\=repeat("\t", len(submatch(0)) / &tabstop)/g<CR>]],
    { desc = "Convert leading spaces to tabs based on tabstop" })

vim.keymap.set("n", "<leader>.w", function() vim.o.wrap = not vim.o.wrap end, { desc = "Wrap toggle" })
vim.keymap.set("n", "<leader>.l", function () vim.cmd("LspStop") end, { desc = "LSP toggle" })

vim.keymap.set("v", "<leader>.>", [[:s/^\(\s\+\)/\1\1/<CR>]], { desc = "Double indentation" })
vim.keymap.set("v", "<leader>.<", [[:s/^\(\s\+\)\1/\1/<CR>]], { desc = "Half indentation" })

vim.keymap.set("n", "<leader>.f", function() NonLspFormat() end, { silent = true, desc = "Format buffer minimally" })
vim.keymap.set("n", "<leader>.F", function()
    NonLspFormat()
    vim.cmd("w")
end, { silent = true,  desc = "Format buffer minimally and write" })
