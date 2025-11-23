-- function Pack(ghpkg) vim.pack.add({"https://github.com/"..ghpkg}) end
--
-- Pack "neovim/nvim-lspconfig"
-- Pack "williamboman/mason.nvim"
-- Pack "mason-org/mason-lspconfig.nvim"
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local lsps = {
			"lua_ls", "bashls", "clangd", "rust_analyzer", "zls", "marksman",
			"gopls", "templ", "html", "htmx", "ts_ls", "cssls", "css_variables",
			"somesass_ls", "tailwindcss", "glsl_analyzer",
		}

		local mason = PRequire("mason")
		if mason then mason.setup() end

		local mlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
		if mlsp_ok then
			mason_lspconfig.setup({
				automatic_enable = true,
				ensure_installed = lsps,
			})
		end

		vim.diagnostic.config({
			float = {
				focusable  = false,
				style      = "minimal",
				source     = "always",
			},
		})

		local lsp_g = Group("LSPs_G", {})
		Autocmd("LspAttach", {
			group = lsp_g,
			callback = function(args)
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = args.buf, desc = "Go to definition" })
				-- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = args.buf, desc = "Hovering definition buf" })
				vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = args.buf, desc = "View workspace symbols" })
				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = args.buf, desc = "View code actions" })
				vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = args.buf, desc = "View references" })
				vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = args.buf, desc = "Rename" })
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = args.buf, desc = "Open floating diagnostic" })
				vim.keymap.set("n", "[d", function() vim.diagnostic.jump(1) end, { buffer = args.buf, desc = "Next diagnostic", remap = true})
				vim.keymap.set("n", "]d", function() vim.diagnostic.jump(-1) end, { buffer = args.buf, desc = "Previous diagnostic", remap = true })
				vim.keymap.set("n", "[[", "[d", { buffer = args.buf, desc = "Next diagnostic" })
				vim.keymap.set("n", "]]", "]d", { buffer = args.buf, desc = "Previous diagnostic" })

				-- From Sylvan Franklin's
				-- local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
				--
				-- if client:supports_method('textDocument/completion') then
				-- 	-- Optional: trigger autocompletion on EVERY keypress. May be slow!
				-- 	local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
				-- 	client.server_capabilities.completionProvider.triggerCharacters = chars
				-- 	vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
				-- end
			end,
		})
	end
}
