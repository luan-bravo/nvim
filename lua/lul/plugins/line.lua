return {
	{

	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function ()
			local lln_ok, lualine = pcall(require, "lualine")
			if not lln_ok then return end

			-- @ Rec
			local function recording_register()
				local reg = vim.fn.reg_recording()
				if reg == "" then
					return reg
				end
				return "@" .. reg
			end

			lualine.setup({
				options = { theme = "gruvbox", },
				sections = {
					lualine_a = { recording_register, "mode" },
					lualine_b = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							update_in_insert = false, -- Set to true to update diagnostics in insert mode
							sections = { "error", "warn", "info", "hint" },
							symbols = { error = " ", warn = " ", info = " ", hint = "󰴓 " },
							diagnostics_color = {
								error = { fg = "#ff0000" },
								warn = { fg = "#ffff00" },
								info = { fg = "#00aaff" },
								hint = { fg = "#00ff00" },
							},
						},
					},
					lualine_c = { "%S" },

					lualine_x = { "filename", "filetype", "branch" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				}
			})
		end
	},
}
