return {
    "mfussenegger/nvim-lint",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = { "shellcheck" },
            auto_update = true,
            run_on_start = true,
        })
        local lint = require("lint")
        lint.linters_by_ft = {
            bash = {"shellcheck"},
            zsh = {"shellcheck"},
        }


        lint.linters.shellcheck.cmd = vim.fn.stdpath("data") .. "/mason/bin/shellcheck"
        vim.api.nvim_create_autocmd({"BufWritePost", "BufEnter"}, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
