return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "williamboman/mason.nvim",
        -- "mason-org/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local m_status_ok, mason = pcall(require, "mason")
        if not m_status_ok then return end
        mason.setup()
        local mnd_status_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
        if not mnd_status_ok then return end
        mason_nvim_dap.setup({
            ensure_installed = {
                "codelldb",
            },
            automatic_setup = true,
        })

        local d_status_ok, dap = pcall(require, "dap")
        if not d_status_ok then return end
        local dui_status_ok, dapui = pcall(require, "dapui")
        if not dui_status_ok then return end
        local dvt_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
        if not dvt_status_ok then return end
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



        local mr_status_ok, mason_registry = pcall(require, "mason-registry")
        if not mr_status_ok then return end

        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd

        local CDapGroup = augroup('DapCodeLLDB', { clear = true })
        autocmd('FileType', {
            group = CDapGroup,
            pattern = { "c", "cpp", "cc" },
            callback = function()
                local codelldb = mason_registry.get_package("codelldb")
                local codelldb_adapter = vim.fn.expand "$MASON/packages/codelldb/extension/adapter/codelldb"

                -- Custom breakpoint sign

                dap.adapters.codelldb = {
                    type = "server",
                    port = "${port}",
                    executable = {
                        command = codelldb_adapter,
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
            end
        })

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


        -- TODO: Make into `vim.cmd` commands
        -- -- Telescope integration
        local t_status_ok, telescope = pcall(require, "telescope")
        telescope.load_extension("dap")
        if not t_status_ok then
            return
        end
        vim.keymap.set("n", "<leader>pdc", "<cmd>Telescope dap commands<CR>", { desc = "DAP Commands" })
        vim.keymap.set("n", "<leader>pdb", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "DAP Breakpoint" })
        vim.keymap.set("n", "<leader>pdv", "<cmd>Telescope dap variables<CR>", { desc = "DAP Variables" })
    end,
}
