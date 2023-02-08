local status, null_ls = pcall(require, "null-ls")
if not status then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier,
        -- formatting.black.with({ extra_args = { "--fast " } }),
        -- diagnostics.flake8,
        formatting.stylua,
        diagnostics.eslint,
        null_ls.builtins.completion.spell
    },
})
