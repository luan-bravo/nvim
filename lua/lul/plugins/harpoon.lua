return  {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local hpn_ok, harpoon = pcall(require, "harpoon")
		if not hpn_ok then return end
		harpoon:setup()
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add" })
		vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toggle menu" })
		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
		vim.keymap.set("n", "<leader>!", function() harpoon:list():replace_at(1) end, { desc = "Harpoon replace 1" })
		vim.keymap.set("n", "<leader>@", function() harpoon:list():replace_at(2) end, { desc = "Harpoon replace 2" })
		vim.keymap.set("n", "<leader>#", function() harpoon:list():replace_at(3) end, { desc = "Harpoon replace 3" })
		vim.keymap.set("n", "<leader>$", function() harpoon:list():replace_at(4) end, { desc = "Harpoon replace 4" })
	end,
}

