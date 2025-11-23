return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	cmd = "WhichKeyToggle",
	opts = {
		layout = {
			spacing = 1,
			width = {
				min = 1,
				max = 50,
			},
		},
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 10,
			},
		},
		triggers = {
			{ "<C-w>",  mode = { "n", "v" } }, -- buffers and tabs navigation and transformations
			{ "<leader>t",  mode = { "n" } }, -- Tab nav
			{ "s",  mode = { "n", "v" } }, -- Surround.lua
			{ "S",  mode = { "n", "v" } }, -- Surround.lua
			{ "<leader>.",  mode = { "n", "v" } }, -- Major controls
			{ "<leader>p",  mode = { "n", "v" } }, -- Telescope
			{ "<leader>v",  mode = { "n", "v" } }, -- LSP / old ThePrimeagen keymaps inspired by his experience with Doom Emacs
			{ "<leader><leader>",  mode = { "n", "v" } }, -- Minor controls
			{ "\"",  mode = { "n", "v" } }, -- Registers
			{ "<C-r>",  mode = { "i", "c" } }, -- Registers
			{ "`",  mode = { "n", "v" } }, -- Marks
			{ "'",  mode = { "n", "v" } }, -- Marks
			{ "@",  mode = { "n", "v" } }, -- TODO: List saved commands, make them long sessioned
			{ "g",  mode = { "n", "v" } }, -- g spot
			{ "G",  mode = { "n", "v" } }, -- G spot
			{ "z",  mode = { "n", "v" } }, -- spell, fold, and more nav
			{ "Z",  mode = { "n", "v" } }, -- nothing?
			{ "i",  mode = { "v" } },
			{ "a",  mode = { "v" } },
		},
	},
	keys = { },
}
