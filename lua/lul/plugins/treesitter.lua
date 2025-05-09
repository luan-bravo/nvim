return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local tsc_status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
        if not tsc_status_ok then return end
        ts_configs.setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "c", "cpp", "lua", "rust", "zig", "markdown", "go", "java", "kotlin",
                "javascript", "typescript", "css", "html",
                "bash", "nix",
                "toml", "yaml", "json", "xml",
                "vimdoc", "jsdoc",
            },
            ignore_install = {
                "gitcommit", -- It removes git commit diff highlighting for some reason
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        local tsp_status_ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
        if not tsp_status_ok then return end
        ts_parsers.get_parser_configs()
        ts_parsers.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end
}
