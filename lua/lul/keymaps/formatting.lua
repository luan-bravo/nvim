----------------
-- Formatting --
----------------
Command("Format", function()
	local filters = {}
	filters.ts =
	vim.lsp.buf.format(
		-- {
		-- -- Never request typescript-language-server for formatting
		-- 	filter = function(client) return client.name ~= "ts_ls" end
		-- }
	)
end, { desc = "Open nvim config dir in a new tab with Explorer" })

function NonLspFormat()
	local ignore = {
		gitcommit = true,
		gitrebase = true,
		diff = true,
	}
	local filetype = vim.bo.filetype
	if ignore[filetype] then return end
	-- TODO: make it unnoticeable (not move cursor & pollute undo list/tree or search history)
	vim.cmd([[normal! mz]])
	-- remove white space at EOL
	vim.cmd([[%s/\s\+$//e]])
	-- add spacing to content surrounded by curly brackets w/o spacing
	vim.cmd([[%s/{ \(\S.*\S\) }/{ \1 }/ge]])
	vim.cmd([[undojoin]])
	vim.cmd([[silent exe "normal! ggVG="]])
	vim.cmd([[undojoin]])
	vim.cmd([[normal! `z]])
	vim.cmd([[normal! zz]])
	vim.cmd([[nohl]])
end
Command("NonLspFormat", function() NonLspFormat() end, { desc = "Format buffer minimally" })
vim.keymap.set("n", "<leader>=", "mzggVG=`z",
	{ silent = true, desc = "Fix buffer indentation" })

vim.keymap.set("n", "<leader>.w", function() vim.o.wrap = not vim.o.wrap end,
	{ desc = "Wrap toggle" })
vim.keymap.set("n", "<leader>.l", function () vim.cmd("LspStop") end,
	{ desc = "LSP toggle" })


vim.keymap.set("n", "<leader>.f", function()
	NonLspFormat()
end, { silent = true, desc = "Format buffer minimally" })
vim.keymap.set("n", "<leader>.F", function()
	NonLspFormat()
	vim.cmd("w")
end, { silent = true,  desc = "Format buffer minimally and write" })

vim.keymap.set("n", "<leader>/", ":noh<cr>",
	{ desc = "No highlight search" })
