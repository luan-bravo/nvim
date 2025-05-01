return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<C-p>", builtin.find_files, {}, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>pf", builtin.git_files, {}, { desc = "Telescope git files" })

        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Telescope grep cword" })

        vim.keymap.set("n", "<leader>pWs", function()
            local word  vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Telescope grep cWORD" })

        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Telescope grep string" })

        -- TODO: grep_string ({ search = <virtual> })

        vim.keymap.set("n", "<leader>vh",
            builtin.help_tags,
       { desc = "Telescope help tags" })

        -- TODO: change the following for a decent function
        vim.keymap.set("n", "<leader>pp", ":Telescope<cr>", { desc = "Telescope in command line" })
        vim.keymap.set("n", "<leader>pt", builtin.telescope, { desc = "Telescope in command line" })
        vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>pcb", builtin.current_buffer_fuzzy_find, { desc = "Telescope current buffer fuzzy find" })
        vim.keymap.set("n", "<leader>pm", builtin.marks, { desc = "Telescope marks" })
        vim.keymap.set("n", "<leader>pr", builtin.registers, { desc = "Telescope registers" })
        vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "Telescope keymaps" })
    end
}

