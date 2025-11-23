return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function ()
		local lln_ok, lualine = pcall(require, "lualine")
		if not lln_ok then return end

		-- @ Rec
		local function recording_register()
			local reg = vim.fn.reg_recording()
			if reg == "" then return "" end
			return "@" .. reg
		end

		local diagnostics = {
						"diagnostics",
						sources = { "nvim_diagnostic" },
						update_in_insert = false, -- Set to true to update diagnostics in insert mode
						sections = { "error",      "warn",      "info",      "hint" },
						symbols  = {  error = " ", warn = " ", info = " ", hint = "󰴓 " }, -- TODO: Add Unicode
						diagnostics_color = {
							error = { fg = "#ff0000" },
							warn  = { fg = "#ffff00" },
							info  = { fg = "#00aaff" },
							hint  = { fg = "#00ff00" },
						},
					}

		lualine.setup({
			options = {
				theme = "gruvbox",
				component_separators = { left = "║", right = "║"}, -- U+9553
				section_separators = { left = "▒", right = "▒"}, -- U+2591
			},
			sections = {
				-- Left
				lualine_a = { "mode", recording_register, },
				lualine_b = { },
				lualine_c = { "%S", }, -- showcmd on o-pending

				-- Right
				lualine_x = {
					"branch",
					diagnostics,
					"lsp"
				},
				lualine_y = { "" },
				lualine_z = { "location", },
			}
		})
	end
}
