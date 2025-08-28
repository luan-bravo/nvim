return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        if not cmp_ok then return end
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        local fg_ok, fidget = pcall(require, "fidget")
        if not fg_ok then return end
        fidget.setup({})
        local m_ok, mason = pcall(require, "mason")
        if not m_ok then return end
        mason.setup()
        local mlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not mlsp_ok then return end
        local lspc_ok, lspconfig = pcall(require, "lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "bashls",
                "gopls",
                "zls",
                "ts_ls",
                "eslint",
                "clangd",
                "cssls",
                "rust_analyzer",
                "marksman",
            },

            handlers = {
                function(server_name) -- default handler (optional)
                    if not lspc_ok then return end
                    lspconfig[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                zls = function()
                    if not lspc_ok then return end
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["lua_ls"] = function()
                    if not lspc_ok then return end
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-o>"] = cmp.mapping.close(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'nvim_lua' },
                    { name = 'cmdline' },
                })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        lspconfig.bashls.setup {
            filetypes = { "sh", "bash", "zsh" },
        }
    end
}
