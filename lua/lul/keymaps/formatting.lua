----------------
-- Formatting --
----------------
vim.keymap.set("n", "<leader>=", "mzggVG=`z",
	{ silent = true, desc = "Fix buffer indentation" })

vim.keymap.set("n", "<leader>.w", function() vim.o.wrap = not vim.o.wrap end,
	{ desc = "Wrap toggle" })
vim.keymap.set("n", "<leader>.l", function () vim.cmd("LspStop") end,
	{ desc = "LSP toggle" })

vim.keymap.set("v", "<leader>.>", [[:s/^\(\s\+\)/\1\1/<CR>]],
	{ desc = "Double indentation" })
vim.keymap.set("v", "<leader>.<", [[:s/^\(\s\+\)\1/\1/<CR>]],
	{ desc = "Half indentation" })

vim.keymap.set("n", "<leader>.f", function() NonLspFormat() end,
	{ silent = true, desc = "Format buffer minimally" })
vim.keymap.set("n", "<leader>.F", function()
	NonLspFormat()
	vim.cmd("w")
end, { silent = true,  desc = "Format buffer minimally and write" })

-- TODO: map key to toggle 'TABSIZE' between 4 and 8 chars long (and another one to join with zen mode?)
