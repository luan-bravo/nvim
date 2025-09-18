
return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",

		dependencies = { "rafamadriz/friendly-snippets" },

		config = function()
			local ls_ok, luasnip = pcall(require, "luasnip")
			if not ls_ok then return end
			luasnip.filetype_extend("javascript", { "jsdoc" })

			--- TODO: What is expand?
			vim.keymap.set({"i"}, "<C-s>e", function() luasnip.expand() end, { silent = true, desc = "Expand snippet" })

			vim.keymap.set({"i", "s"}, "<C-s>;", function() luasnip.jump(1) end, { silent = true, desc = "Next snippet" })
			vim.keymap.set({"i", "s"}, "<C-s>,", function() luasnip.jump(-1) end, { silent = true, desc = "Previous snippet" })

			vim.keymap.set({"i", "s"}, "<C-E>", function()
				if luasnip.choice_active() then
					luasnip.change_choice(1)
				end
			end, { silent = true, desc = "Change active snippet (?)" })
		end,
	}
}

