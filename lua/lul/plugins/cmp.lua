return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	build = "cargo build --release",

	opts = {
		-- Default conditions: (vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false)
		-- Note that the default conditions are ignored when `vim.b.completion` is explicitly set to `true`
		--
		-- Exceptions: vim.bo.filetype == 'dap-repl'
		-- enabled = function() return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype) end,

		keymap = {
			preset = "default",
			-- All presets mappings:
			-- `C-n`/`C-p` or `Up`/`Down`: Focus on next/previous suggestion
			-- `C-space`: Open menu (or docs if already open)
			-- `C-e`: Hide menu
			-- `C-k`: Toggle signature help (if signature.enabled = true)
		},


		-- Adjusts spacing to ensure icons are aligned
		-- { `mono` (default) for "Nerd Font Mono" or `normal` for "Nerd Font"
		appearance = { nerd_font_variant = "normal", },

		completion = {
			menu = {
				auto_show = true,
			},
			documentation = {
				auto_show = true, auto_show_delay_ms = 500,
			},
			list = {
				selection = {
					preselect = true, auto_insert = true,
				},
			},
			-- list = {
			-- selection = {
			-- preselect = function(ctx) return vim.bo.filetype ~= 'markdown' end } },
			accept = {
				auto_brackets = {
					enabled = true
				},
			},
			ghost_text = {
				enabled = false
			},
		},

		-- Default list of enabled providers defined so that you can extend it elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},

		-- Rust fuzzy matcher for typo resistance and significantly better performance
		fuzzy = {
			implementation = "prefer_rust_with_warning", -- Prefer rust fzf with fallback lua fzf with(out) warning
		},
	},
	opts_extend = { "sources.default" },
	-- config = function()
		-- local m = {
		--
		--
		-- 	'neovim/nvim-lspconfig',
		-- 	dependencies = { 'saghen/blink.cmp' },
		--
		-- 	-- example using `opts` for defining servers
		-- 	opts = {
		-- 		servers = {
		-- 			lua_ls = {}
		-- 		},
		-- 		completion = {menu = {draw = {treesitter = { 'lsp' }}}},
		-- 	},
		-- 	config = function(_, opts)
		-- 		local lspconfig = require('lspconfig')
		-- 		for server, config in pairs(opts.servers) do
		-- 			-- passing config.capabilities to blink.cmp merges with the capabilities in your
		-- 			-- `opts[server].capabilities, if you've defined it
		-- 			config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
		-- 			lspconfig[server].setup(config)
		-- 		end
		-- 	end,
		--
		-- 	-- example calling setup directly for each LSP
		-- 	config = function()
		-- 		local capabilities = require('blink.cmp').get_lsp_capabilities()
		-- 		local lspconfig = require('lspconfig')
		--
		-- 		lspconfig['lua_ls'].setup({ capabilities = capabilities })
		-- 	end,
		-- }
		--
		--
		--
		-- local capabilities = {
		-- 	textDocument = {
		-- 		foldingRange = {
		-- 			dynamicRegistration = false,
		-- 			lineFoldingOnly = true
		-- 		}
		-- 	}
		-- }
		--
		-- capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
		--
		-- -- or equivalently
		--
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		--
		-- capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))
		--
		-- capabilities = vim.tbl_deep_extend('force', capabilities, {
		-- 	textDocument = {
		-- 		foldingRange = {
		-- 			dynamicRegistration = false,
		-- 			lineFoldingOnly = true
		-- 		}
		-- 	}
		-- })
	-- end
}
