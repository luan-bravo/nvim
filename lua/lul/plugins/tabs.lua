return {
	"kdheepak/tabline.nvim",
	requires = {
		{ "hoob3rt/lualine.nvim", opt=true },
		{"kyazdani42/nvim-web-devicons", opt = true}
	},
	config = function()
		local tl_ok, tabline = pcall(require, "tabline")
		if tl_ok then return end

		tabline.setup({
			-- Defaults configuration options
			enable = true,
			options = {
				-- If lualine is installed tabline will use separators configured in lualine by default.
				-- These options can be used to override those settings.
				max_bufferline_percent = 100,
				show_tabs_always = true,
				show_devicons = false,
				show_bufnr = false,
				show_filename_only = true,
				modified_icon = "",
				modified_italic = false,
				show_tabs_only = false,
			}
		})
		vim.opt_local.guioptions:remove("e") -- Use showtabline in gui vim
		vim.opt_local.sessionoptions:append({"tabpages", "globals"}) -- store tabpages and globals in session
	end,
}
