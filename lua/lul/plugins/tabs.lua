return {
	{
		'kdheepak/tabline.nvim',
		requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} },
		config = function()
			require'tabline'.setup {
				-- Defaults configuration options
				enable = true,
				options = {
					-- If lualine is installed tabline will use separators configured in lualine by default.
					-- These options can be used to override those settings.
					section_separators = {'', ''},
					component_separators = {'', ''},
					max_bufferline_percent = 100,
					show_tabs_always = false,
					show_devicons = true,
					show_bufnr = false,
					show_filename_only = true,
					modified_icon = "+ ",
					modified_italic = false,
					show_tabs_only = false,
				}
			}
			vim.cmd[[
				set guioptions-=e " Use showtabline in gui vim
				set sessionoptions+=tabpages,globals " store tabpages and globals in session
			]]
		end,
	}
}
