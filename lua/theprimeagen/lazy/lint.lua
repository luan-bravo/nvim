return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            bash = {"shellcheck"},
            zsh = {"shellcheck"},
        }

        vim.api.nvim_create_autocmd({"BufWritePost", "BufEnter"}, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
