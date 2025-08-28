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
        local m_ok, mason = pcall(require, "mason")
        if not m_ok then return end
        mason.setup()
        local mnd_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
        if not mnd_ok then return end
        mason_nvim_dap.setup({
            ensure_installed = {
                "codelldb",
            },
            automatic_setup = true,
        })

        local d_ok, dap = pcall(require, "dap")
        if not d_ok then return end
        local dui_ok, dapui = pcall(require, "dapui")
        if not dui_ok then return end
        local dvt_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
        if not dvt_ok then return end
        dap_virtual_text.setup({
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



        local mr_ok, reg = pcall(require, "mason-registry")
        if not mr_ok then return end
        local codelldb = reg.get_package("codelldb")

        -- local function printTable(table)
        --     for k, v in pairs(table) do
        --         print(k)
        --         if type(v)=="table" then
        --             for a, b in pairs(v) do
        --                 print("\t" .. k .. a)
        --                 if type(b)=="table" then
        --                     print("\t" .. "\t- " .. "<table>")
        --                 else
        --                     print("\t" .. "\t- " .. b)
        --                 end
        --             end
        --         else
        --             if type(v)=="table" then
        --                 print("\t" .. "\t- " .. "<table>")
        --             else
        --                 print("\t" .. "\t- " .. v)
        --             end
        --         end
        --     end
        -- end
        -- printTable(codelldb)


        -- Why do things just stop working and have no information about it nowhere?
        -- local codelldb_adapter_path = codelldb:get_install_path() .. "/extension/adapter/codelldb"
        local home = os.getenv("HOME")
        local codelldb_adapter_path = home .. "/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
        -- print(codelldb_adapter_path)


        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = codelldb_adapter_path,
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

        -- Custom breakpoint sign
        vim.fn.sign_define("DapBreakpoint", {
            text = "🔴",
            texthl = "SignColumn",
            linehl = "",
            numhl = ""
        })

        -- Steps
        vim.keymap.set({ "n", "i" }, "<F1>", dap.continue, { desc = "DAP continue" })
        vim.keymap.set({ "n", "i" }, "<F2>", dap.step_into, { desc = "DAP step into" })
        vim.keymap.set({ "n", "i" }, "<F3>", dap.step_over, { desc = "DAP step over" })
        vim.keymap.set({ "n", "i" }, "<F4>", dap.step_out, { desc = "DAP step out" })
        vim.keymap.set({ "n", "i" }, "<F5>", dap.step_back, { desc = "DAP step back" })
        -- Breakpoints
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
        vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "DAP run to cursor" })
        vim.keymap.set("n", "<leader>B", function()
            dap.clear_breakpoints()
        end, { desc = "DAP clear breakpoints" })
        vim.keymap.set("n", "<leader>%", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "DAP set breakpoint" })
        vim.keymap.set("n", "<leader>?", function()
            -- Eval val under cursor (taken from tjdevries)
            dapui.eval(nil, { enter = true })
        end, { desc = "DAP eval val under cursor (taken from tjdevries)" })
        -- Debug session
        vim.keymap.set("n", "<leader>*", function()
            dap.terminate()
        end, { desc = "DAP terminate" })
        vim.keymap.set("n", "<leader>&", function()
            dap.restart()
        end, { desc = "DAP restart" })


        -- TODO: Make into cmd commands
        -- -- Telescope integration
        local t_ok, telescope = pcall(require, "telescope")
        telescope.load_extension("dap")
        if not t_ok then return end
        vim.keymap.set("n", "<leader>pdc", "<cmd>Telescope dap commands<CR>", { desc = "DAP Commands" })
        vim.keymap.set("n", "<leader>pdb", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "DAP Breakpoint" })
        vim.keymap.set("n", "<leader>pdv", "<cmd>Telescope dap variables<CR>", { desc = "DAP Variables" })
    end,
}
