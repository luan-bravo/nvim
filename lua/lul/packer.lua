vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "ellisonleao/gruvbox.nvim" })
	-- use 'nvim-lua/plenary.nvim'
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("neovim/nvim-lspconfig")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	use("windwp/nvim-autopairs")
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("glepnir/lspsaga.nvim")
	use("cohama/lexima.vim")
	use("tpope/vim-rhubarb")
	use("jose-elias-alvarez/null-ls.nvim")
	use("numToStr/Comment.nvim")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})
	use("onsails/lspkind.nvim")
	use("MunifTanjim/prettier.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
			},
		},
	})
	use("kabouzeid/nvim-lspinstall")
	use("Exafunction/codeium.vim")
	use("lukas-reineke/indent-blankline.nvim")
	use("stevearc/vim-arduino")
	use("mfussenegger/nvim-dap")
	use("mxsdev/nvim-dap-vscode-js")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})
  use("nvim-neotest/nvim-nio")
end)
