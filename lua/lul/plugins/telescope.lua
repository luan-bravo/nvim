return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local tele_ok, telescope = pcall(require, "telescope")
		local act_ok, actions = pcall(require, "telescope.actions")
		local blt_ok, builtin = pcall(require, "telescope.builtin")
		if not(tele_ok or act_ok or blt_ok) then
			return
		end
		-- ACTIONS
		local actions_ni = {
			["<C-k>"] = actions.cycle_history_prev,
			["<C-j>"] = actions.cycle_history_next,
			["<C-t>"] = actions.select_tab,
		}
		telescope.setup({
			defaults = {
				mappings = {
					i = actions_ni,
					n = actions_ni
				},
			}
		})

		-- KEYMAPS

		---Telescope key
		local tk = "s"
		---Telescope leader key combo
		local tl = "<leader>"..tk

		-- Telescope
		-- vim.keymap.set("n", tl..tk, vim.cmd.Telescope, { desc = "Telescope in command line" })

		-- Find
		vim.keymap.set("n", tl.."f", builtin.find_files,
			{ desc = "Telescope find files" })
		vim.keymap.set("n", "<C-f>", builtin.git_files,
			{ desc = "Telescope git files" })

		-- Simple Built-in
		vim.keymap.set("n", tl..tk, builtin.resume,
			{ desc = "Telescope resume" })
		vim.keymap.set("n", tl.."di", builtin.diagnostics,
			{ desc = "Telescope diagnostics" })
		vim.keymap.set("n", tl.."r", builtin.registers,
			{ desc = "Telescope registers" })
		vim.keymap.set("n", tl.."mk", builtin.marks,
			{ desc = "Telescope marks" })
		vim.keymap.set("n", tl.."k", builtin.keymaps,
			{ desc = "Telescope keymaps" })
		vim.keymap.set("n", tl.."j", builtin.jumplist,
			{ desc = "Telescope jump list" })
		vim.keymap.set("n", tl.."b", builtin.buffers,
			{ desc = "Telescope buffers" })
		vim.keymap.set("n", tl.."cb", builtin.current_buffer_fuzzy_find,
			{ desc = "Telescope current buffer fuzzy find" })


		-- Grep
		vim.keymap.set("n", tl.."g", builtin.live_grep,
			{ desc = "Telescope live grep" })

		vim.keymap.set("n", tl.."S", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Telescope grep string" })

		vim.keymap.set("x", tl.."S", function ()
			vim.cmd("norm! gv\"zy")
			builtin.grep_string({ search = vim.fn.getreg("z") })
		end, { desc = "Telescope grep selection" })

		local gs = 
		vim.keymap.set("n", tl.."wS", function(word)
			builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
		end, { desc = "Telescope grep cword" })

		vim.keymap.set("n", tl.."WS", function()
			builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
		end, { desc = "Telescope grep cWORD" })

		-- Help
		vim.keymap.set("n", tl.."h", builtin.help_tags,
			{ remap = true, desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>vh", tl.."h",
			{ remap = false, desc = "Telescope help tags (alias)" })
		-- TODO: Configure telescope to always get all man pages sections. Then refactor this to look like the rest of the key maps
		vim.keymap.set("n", tl.."mp", function()
			builtin.man_pages({ sections = { "ALL" } })
		end, { desc = "Telescope man pages" })

	end
}
