return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		local tele_ok, telescope = pcall(require, "telescope")
		if not tele_ok then return end
		local act_ok, actions = pcall(require, "telescope.actions")
		if not act_ok then return end
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.cycle_history_next,
					},
					n = {
						["<C-k>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.cycle_history_next,
					},
				},
			}
		})
		local blt_ok, builtin = pcall(require, "telescope.builtin")
		if not blt_ok then return end
		vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>pf", builtin.git_files, { desc = "Telescope git files" })
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Telescope grep cword" })
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Telescope grep cWORD" })
		vim.keymap.set("n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "Telescope grep string" })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("x", "<leader>ps", function ()
			vim.cmd([[exe "norm! \<esc>gv\"zy"]])
			builtin.grep_string({ search = vim.fn.getreg("z") })
		end, { desc = "Telescope grep selection" })
		vim.keymap.set("n", "<leader>pp", vim.cmd.Telescope, { desc = "Telescope in command line" })
		vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>pcb", builtin.current_buffer_fuzzy_find, { desc = "Telescope current buffer fuzzy find" })
		vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>pmk", builtin.marks, { desc = "Telescope marks" })
		-- TODO: Configure telescope to always get all man pages sections. Then refactor this to look like the rest of the key maps
		vim.keymap.set("n", "<leader>pmp", function() builtin.man_pages({ sections = { "ALL" } }) end, { desc = "Telescope man pages" })
		vim.keymap.set("n", "<leader>pr", builtin.registers, { desc = "Telescope registers" })
		vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "Telescope keymaps" })
		vim.keymap.set("n", "<leader>pj", builtin.jumplist, { desc = "Telescope jump list" })
		vim.keymap.set("n", "<leader>pdi", builtin.diagnostics, { desc = "Telescope diagnostics" })
		vim.keymap.set("n", "<leader>p/", builtin.resume, { desc = "Telescope resume" })
	end
}
