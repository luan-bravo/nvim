--[[
return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },

    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
        end

        vim.keymap.set("n", "<leader>ui", require("dapui").toggle)
    end
}
]]

return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        local dapui = require("dapui")

        dapui.setup({
            layouts = {
                {
                    elements = {
                        "scopes",
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = { "repl", "console" },
                    size = 10,
                    position = "bottom",
                },
            },
        })

        local dap = require("dap")
        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        vim.keymap.set("n", "<leader>ui", dapui.toggle, { desc = "Toggle DAP UI" })
    end
}
