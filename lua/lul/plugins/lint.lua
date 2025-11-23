return {
	"mfussenegger/nvim-lint",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		local mti_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
		if not mti_ok then return end
		mason_tool_installer.setup({
			ensure_installed = { "shellcheck" },
			auto_update = true,
			run_on_start = true,
		})

		local lint_ok, lint = pcall(require, "lint")
		if not lint_ok then return end
		lint.linters_by_ft = {
			bash = {"shellcheck"},
			zsh = {"shellcheck"},
		}


		lint.linters.shellcheck.cmd = vim.fn.stdpath("data") .. "/mason/bin/shellcheck"

		local lint_g = Group("lint_g", {})
		Autocmd({"BufWritePost", "BufEnter"}, {
			group = lint_g,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
