return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
        local dap = require("dap")

        vim.keymap.set("n", "<F5>", require("dap").continue)
        vim.keymap.set("n", "<F10>", require("dap").step_over)
        vim.keymap.set("n", "<F11>", require("dap").step_into)
        vim.keymap.set("n", "<F12>", require("dap").step_out)
        vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
        vim.keymap.set("n", "<leader>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end)
        -- Custom breakpoint sign
        vim.fn.sign_define("DapBreakpoint", {
            text = "🔴",
            texthl = "SignColumn",
            linehl = "",
            numhl = ""
        })

        dap.adapters.c = {
            type = "executable",
            command = "codelldb",
            name = "lldb"
        }

        dap.configurations.c = {
            {
                name = "Launch file",
                type = "c",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.zig = dap.configurations.c

        dap.adapters.cpp = dap.adapters.c
        dap.adapters.zig = dap.adapters.c
        dap.adapters.rust = dap.adapters.c
        dap.configurations.rust = {
            {
                name = "Launch",
                type = "rust",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }

        dap.adapters.go = {
            type = "server",
            port = "${port}",
            executable = {
                command = "dlv",
                args = { "dap", "-l", "127.0.0.1:${port}" },
            }
        }

        dap.configurations.go = {
            {
                type = "go",
                name = "Debug",
                request = "launch",
                program = "${file}",
            },
            {
                type = "go",
                name = "Debug Test",
                request = "launch",
                mode = "test",
                program = "${file}",
            },
        }

        -- Telescope integration
        require("telescope").load_extension("dap")
        vim.keymap.set("n", "<leader>dc", "<cmd>Telescope dap commands<CR>", { desc = "DAP Commands" })
        vim.keymap.set("n", "<leader>db", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "DAP Breakpoint" })
        vim.keymap.set("n", "<leader>dv", "<cmd>Telescope dap variables<CR>", { desc = "DAP Variables" })
    end,
}
