
return {
	"folke/zen-mode.nvim",
	config = function()
		local zen_ok, zen = pcall(require, "zen-mode")
		if not zen_ok then return end
		vim.keymap.set("n", "<leader>zz", function()
			zen.setup {
				window = {
					width = 90,
					options = { }
				},
			}
			zen.toggle()
			-- vim.wo.wrap = false
			vim.wo.number = true
			vim.wo.rnu = true
			ColorMyPencils()
		end, { desc = "Zen Shallow"})


		vim.keymap.set("n", "<leader>zZ", function()
			zen.setup {
				window = {
					width = 80,
					options = { }
				},
			}
			zen.toggle()
			-- vim.wo.wrap = false
			vim.wo.number = false
			vim.wo.rnu = false
			vim.opt.colorcolumn = "0"
			ColorMyPencils()
		end, { desc = "Zen Deep"})
	end
}


