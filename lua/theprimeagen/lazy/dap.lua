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

        --[[
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                -- 💀 Make sure to update this path to point to your installation
                args = {"/path/to/js-debug/src/dapDebugServer.js", "${port}"},
            }
        }
        dap.adapters.chrome

        local js_based_languages = { "typescript", "javascript", "javascriptreact", "typescriptreact" }
        for _, language in ipairs(js_based_languages) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
                {
                    {
                        type = "chrome",
                        request = "attach",
                        program = "${file}",
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                        protocol = "inspector",
                        port = 9222,
                        webRoot = "${workspaceFolder}"
                    }
                },
                {
                    {
                        type = "chrome",
                        request = "attach",
                        program = "${file}",
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                        protocol = "inspector",
                        port = 9222,
                        webRoot = "${workspaceFolder}"
                    }
                },
            }
        end
        ]]--

        dap.adapters.c = {
            type = "executable",
            command = "codelldb",
            name = "lldb"
        }

        dap.configurations.c = {
            {
                name = "Launch file",
                type = "cpp",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }

        dap.adapters.cpp = dap.adapters.c
        dap.configurations.cpp = dap.configurations.c

        dap.adapters.zig = dap.adapters.c
        dap.configurations.zig = dap.configurations.c

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
    end,
}

