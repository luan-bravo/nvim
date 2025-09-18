return {
	{
		"folke/trouble.nvim",
		config = function()
			local trb_ok, trouble = pcall(require, "trouble")
			if not trb_ok then return end
			trouble.setup({
				icons = true,
			})
			vim.keymap.set("n", "<leader>tt", function()
				trouble.toggle()
			end, { desc = "Trouble toggle" })
			vim.keymap.set("n", "[t", function()
				trouble.next({skip_groups = true, jump = true});
			end, { desc = "Trouble next" })
			vim.keymap.set("n", "]t", function()
				trouble.previous({skip_groups = true, jump = true});
			end, { desc = "Trouble previous" })
		end
	},
}
