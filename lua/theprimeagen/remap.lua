vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "LSP Restart" })

--[[
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)
--]]

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Delete to void and Paste" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>D", [["_d]], { desc = "Delete to void" })

-- This is going to get me canceled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux neww sessionizer" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Cnext" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Cprev" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Lnext" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Lprev" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word" })

vim.keymap.set("n", "<leader><leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it Rain" });

vim.keymap.set("n", "<leader><leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source nvim config" })

-- why vim.cmd not work here like under there?
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" } )
vim.keymap.set("n", "<leader>W", ":wall<CR>", { desc = "Write All" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":quit!<CR>", { desc = "Quit!" })

vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Buffer Delete" })
vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Buffer Next" })

vim.keymap.set({"n","i","v"}, "<PageUp>", "<PageUp>zz")
vim.keymap.set({"n","i","v"}, "<PageDown>", "<PageDown>zz")

vim.keymap.set("n", "<leader>.w", function()
        vim.wo.wrap = not vim.wo.wrap
    end, { desc = "Toggle wrap" }
)

-- Track the messages buffer number -- grok
local messages_bufnr = nil
vim.keymap.set("n", "<leader>msg", function()
        if messages_bufnr and vim.api.nvim_buf_is_valid(messages_bufnr) then
            vim.cmd("bwipeout " .. messages_bufnr)
            messages_bufnr = nil
        end
        vim.cmd("below 10split +enew")
        messages_bufnr = vim.api.nvim_get_current_buf()
        vim.cmd("redir @\">")
        vim.cmd("silent messages")
        vim.cmd("redir END")
        vim.cmd("put")
        vim.bo.modifiable = true
        vim.bo.filetype = "text"
        vim.bo.buftype = "nofile"
        vim.cmd("normal! gg")
    end,
    { noremap = true, desc = "Opens hsplit buffer with ':messages' contents" }
)

-- Go to first letter character
vim.keymap.set("n", "<leader>fl", function()
        vim.cmd("normal! 0")
        vim.fn.search("[a-zA-Z]", "c", vim.fn.line("."))
    end,
    { noremap=true, silent=true, desc = "Go to first letter character" }
)

-- Go to first alphanulmeric character
vim.keymap.set("n", "<leader>fa", function()
        vim.cmd("norm! 0")
        vim.fn.search("[a-zA-Z0-9]", "c", vim.fn.line("."))
    end,
    { noremap=true, silent=true, desc = "Go to first alphanulmeric character" }
)
