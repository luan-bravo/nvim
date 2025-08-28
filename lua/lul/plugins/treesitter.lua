return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local tsc_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
        if not tsc_ok then return end
        ts_configs.setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "c", "cpp", "lua", "rust", "zig", "go", "java", "kotlin", "python",
                "javascript", "typescript", "css", "html",
                "bash", "nix",
                "toml", "yaml", "json", "xml",
                "markdown", "markdown_inline", "regex",
                "vimdoc", "jsdoc",
            },
            ignore_install = {
                "gitcommit",
            },

            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        local tsp_ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
        if not tsp_ok then return end
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
