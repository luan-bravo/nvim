return {
    {
        "nvim-neotest/neotest",
        "nvim-neotest/nvim-nio",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-plenary",
        },
        config = function()
            local nt_ok, neotest = pcall(require, "neotest")
            if not nt_ok then return end
            local ntvt_ok, nt_vitest = pcall(require, "neotest-vitest")
            if not ntvt_ok then return end
            local ntpl_ok, nt_plenary = pcall(require, "neotest-plenary")
            if not ntpl_ok then return end
            neotest.setup({
                adapters = {
                    nt_vitest,
                    nt_plenary.setup({
                        -- this is my standard location for minimal vim rc
                        -- in all my projects
                        min_init = "./scripts/tests/minimal.vim",
                    }),
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end, { desc = "Neotest run" })
        end,
    },
}

