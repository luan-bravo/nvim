return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "codelldb",
            },
            automatic_setup = true,
        })

        local dap = require("dap")
        local dapui = require("dapui")
        require("nvim-dap-virtual-text").setup({
            -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
            display_callback = function(variable)
              local name = string.lower(variable.name)
              local value = string.lower(variable.value)
              if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
                return "*****"
              end

              if #variable.value > 15 then
                return " " .. string.sub(variable.value, 1, 15) .. "... "
              end

              return " " .. variable.value
            end,
      })

        -- UI
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end



        local mason_registry = require("mason-registry")
        local codelldb = mason_registry.get_package("codelldb")
        local codelldb_path = codelldb:get_install_path() .. "/extension/adapter/codelldb"

        -- Custom breakpoint sign

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = codelldb_path,
                args = {
                    "--port", "${port}",
                }
            }
        }

        dap.configurations.c = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }

        --[[
        dap.adapters.c = {
            type = "executable",
            command = "codelldb",
            name = "lldb"
        }
        ]]

        -- TODO: Actually set these up later and for js/ts
        --[[
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
        ]]

        vim.fn.sign_define("DapBreakpoint", {
            text = "🔴",
            texthl = "SignColumn",
            linehl = "",
            numhl = ""
        })

        -- Steps
        vim.keymap.set({ "n", "i" }, "<F1>", dap.continue)
        vim.keymap.set({ "n", "i" }, "<F2>", dap.step_into)
        vim.keymap.set({ "n", "i" }, "<F3>", dap.step_over)
        vim.keymap.set({ "n", "i" }, "<F4>", dap.step_out)
        vim.keymap.set({ "n", "i" }, "<F5>", dap.step_back)
        -- Breakpoints
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
        vim.keymap.set("n", "<leader>B", function()
            dap.clear_breakpoints()
        end)
        vim.keymap.set("n", "<leader>%", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end)
        vim.keymap.set("n", "<leader>?", function()
            -- Eval val under cursor (taken from tjdevries)
            dapui.eval(nil, { enter = true })
        end)
        -- Debug session
        vim.keymap.set("n", "<leader>*", function()
            dap.terminate()
        end)
        vim.keymap.set("n", "<leader>&", function()
            dap.restart()
        end)


        -- Telescope integration
        require("telescope").load_extension("dap")
        vim.keymap.set("n", "<leader>dc", "<cmd>Telescope dap commands<CR>", { desc = "DAP Commands" })
        vim.keymap.set("n", "<leader>db", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "DAP Breakpoint" })
        vim.keymap.set("n", "<leader>dv", "<cmd>Telescope dap variables<CR>", { desc = "DAP Variables" })
    end,
}
