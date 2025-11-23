return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree Toggle" })

		-- Redo (go down undotree)
		local undo_g = Group("UndoTree", {})
		Autocmd({ "BufEnter", "BufNewFile" }, {
			group = undo_g,
			pattern = "*",
			callback = function()
				if vim.bo.buftype == "" then
					vim.keymap.set("n", "U", "<C-R>", { noremap = true, buffer = true, desc = "Redo" })
				end
			end,
		})

	end
}
