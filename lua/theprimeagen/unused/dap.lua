return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
        local dap = require("dap")

        -- Set keymaps to control the debugger
        vim.keymap.set("n", "<F5>", require("dap").continue)
        vim.keymap.set("n", "<F10>", require("dap").step_over)
        vim.keymap.set("n", "<F11>", require("dap").step_into)
        vim.keymap.set("n", "<F12>", require("dap").step_out)
        vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
        vim.keymap.set("n", "<leader>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end)

        local js_based_languages = { "typescript", "javascript", "typescriptreact" }

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
                    type = "pwa-chrome",
                    request = "launch",
                    name = 'Start Chrome with "localhost"',
                    url = "http://localhost:3000",
                    webRoot = "${workspaceFolder}",
                    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
                },
            }
        end
    end
}
