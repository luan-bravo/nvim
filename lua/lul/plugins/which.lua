return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	cmd = "WhichKeyToggle",
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 10
			},
		},
		triggers = {
			{ "<C-w>",  mode = { "n", "v" } },
			{ "s",  mode = { "n", "v" } },
			{ "S",  mode = { "n", "v" } },
			{ "<leader>.",  mode = { "n", "v" } },
			{ "<leader>p",  mode = { "n", "v" } },
			{ "<leader>v",  mode = { "n", "v" } },
			{ "<leader><leader>",  mode = { "n", "v" } },
			{ "\"",  mode = { "n", "v" } },
			{ "`",  mode = { "n", "v" } },
			{ "'",  mode = { "n", "v" } },
			{ "@",  mode = { "n", "v" } },
			{ "g",  mode = { "n", "v" } },
			{ "z",  mode = { "n", "v" } },
			{ "Z",  mode = { "n", "v" } },
			{ "<C-r>",  mode = { "i", "c" } },
		},
	},
	keys = { },
}
