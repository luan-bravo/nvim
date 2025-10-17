return {
	{
		"windwp/nvim-ts-autotag", -- Automatically renames and closes HTML/HTMX/JSX tags
		config = function()
			local at = SafeRequire("nvim-ts-autotag")
			if not at then return end
			at.setup({
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close_on_slash = true, -- Auto close on trailing '</'
				}
			})
		end,
	},
}
