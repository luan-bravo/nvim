vim.g.mapleader = " "
local km = vim.keymap.set

------------------
-- Moves/Basics --
------------------
km("n", "J", "mzJ`z", { desc = "Join line w/o moving cursor" })
-- km({ "n","i","v" }, "<C-d>", "<C-d>zz")
-- km({ "n","i","v" }, "<C-u>", "<C-u>zz")
-- km({ "n","i","v" }, "<PageUp>", "<PageUp>zz")
-- km({ "n","i","v" }, "<PageDown>", "<PageDown>zz")
--
-- km({ "n","v" }, "n", "nzzzv")
-- km({ "n","v" }, "N", "Nzzzv")
-- km({ "n","v" }, "{", function () vim.cmd("normal! {zz") end)
-- km({ "n","v" }, "}", function () vim.cmd("normal! }zz") end)
-- This is going to get me canceled
km({ "n","i","v" }, "<C-c>", "<Esc>", { desc = "Escape" })
km({ "n","v" }, "Q", "<nop>")
-- TODO: Fix keyboard config with ZSH and whatever else I'll be using to fix these key maps
-- km("i", "<S-BS>", "<C-w>")
-- km("i", "<S-Del>", "<C-o>dw")
km("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
km("i", "<C-Del>", "<C-o>dw", { desc = "Delete next word" })
km("n", "<S-F10>", "z=", { desc = "Correct spelling alias" })

------------------------------
-- Buffer/File Manipulation --
------------------------------
km("n", "<leader>w", function() vim.cmd("w") end, { desc = "Write" } )
km("n", "<leader>W", function() vim.cmd("wall") end, { desc = "Write All" })
km("n", "<leader>q", function() vim.cmd("quit") end, { desc = "Quit" })
km("n", "<leader>Q", function() vim.cmd("quit!") end, { desc = "Quit!" })
km("n", "<leader>x", function() vim.cmd("bdelete") end, { desc = "Buffer Delete" })
km("n", "<leader>X", function() vim.cmd("bdelete!") end, { desc = "Buffer Delete!" })
km("n", "<leader>h", function() vim.cmd("bprevious") end, { desc = "Buffer Previous" })
km("n", "<leader>l", function() vim.cmd("bnext") end, { desc = "Buffer Next" })


----------------
-- Formatting --
----------------
km("n", "<leader>.w", function() vim.o.wrap = not vim.o.wrap end, { desc = "Wrap toggle" })
km("v", "<leader>.>", [[:s/^\(\s\+\)/\1\1/<CR>]], { desc = "Double indentation" })
km("v", "<leader>.<", [[:s/^\(\s\+\)\1/\1/<CR>]], { desc = "Half indentation" })
km("n", "<leader>=", "mzggVG=`z", { silent = true, desc = "Fix buffer indentation" })
km("n", "<leader>.f", function() NonLspFormat() end, { silent = true, desc = "Format buffer minimally" })
km("n", "<leader>.F", function()
    NonLspFormat()
    vim.cmd("w")
end, { silent = true,  desc = "Format buffer minimally and write" })


------------------------------------
-- Non-Basic but Great and Simple --
------------------------------------
km("v", "J", [[:move '>+1<CR>gv=gv]], { desc = "Move line down", silent = true })
km("v", "K", [[:move '<-2<CR>gv=gv]], { desc = "Move line up", silent = true })
km("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word" })
-- TODO: WTF do these do?
km("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Cnext" })
km("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Cprev" })
km("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Lnext" })
km("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Lprev" })


--------------
-- Specific --
--------------
km("n", "<leader><leader><leader>", function() vim.cmd("so") end, { desc = "Source nvim config" })
km("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux neww sessionizer" })
km("n", "<leader>zig", "<cmd>LspRestart<CR>", { desc = "LSP Restart" })
km("n", "<leader><leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it Rain" });
km("n", "<leader>vwm", function()
    local vwm_status_ok, vwm = pcall(require, "vim-with-me")
    if not vwm_status_ok then return end
    vwm.StartVimWithMe()
end, {desc = "VimWithMe start"})
km("n", "<leader>svwm", function()
    local vwm_status_ok, vwm = pcall(require, "vim-with-me")
    if not vwm_status_ok then return end
    vwm.StopVimWithMe()
end, {desc = "VimWithMe stop"})


---------------
-- Clipboard --
---------------
km({ "n", "v" }, "<leader>P", [["+p]], { desc = "Paste from clipboard" })
-- next greatest remap ever : asbjornHaland
km({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection to clipboard" })
km({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank from cursor to end of  line to clipboard" })
km({ "n", "v" }, "<leader>D", [["_d]], { desc = "Delete to void" })
km({ "n", "v" }, "<leader>d", [["+d]], { desc = "Delete to clipboard" })
-- greatest remap ever
km("x", "<leader>dp", [["_dP]], { desc = "Delete to void and Paste" })


----------------------
-- Custom Functions --
----------------------
-- Vertical Explore w/ netrw
local api_status_ok, _ = pcall(require, "nvim-tree.api")
if not api_status_ok then
    km("n", "<leader>e", function ()
        local netrw_found = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'filetype') == 'netrw' then
                netrw_found = true
                vim.api.nvim_win_close(win, true)
                break
            end
        end
        if not netrw_found then
            vim.cmd('Vexplore')
        end
    end, { silent = true, desc = "Toggle Vexplore"})
end
-- Track the messages buffer number
km("n", "<leader>msg", function()
    local messages_bufnr = nil
    local noi_status_ok, _ = pcall(require, "noice")
    if noi_status_ok then
        vim.cmd.messages()
        -- TODO?: maybe also implement for mini? Not using it, not gonna do now
    else
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
    end
end, { noremap = true, desc = "Opens hsplit buffer with ':messages' contents" })
-- Go to first letter character in line
km("n", "<leader>fl", function()
    vim.cmd("normal! 0")
    vim.fn.search("[a-zA-Z]", "c", vim.fn.line("."))
end, { noremap=true, silent=true, desc = "Go to first letter character" })
-- Go to first alphanumeric character in line
km("n", "<leader>fa", function()
    vim.cmd("normal! 0")
    vim.fn.search("[a-zA-Z0-9]", "c", vim.fn.line("."))
end, { noremap=true, silent=true, desc = "Go to first alphanulmeric character" })
-- Add rare spelling to my dict
km("n", "z/", function()
    vim.cmd("normal! mz")
    vim.cmd("spellrare! "  .. vim.fn.expand("<cWORD>\'"))
    vim.cmd("normal! `z")
end, { noremap = true, desc = "Add rare spelling to file", })


-------------------
-- Surround Text --
-------------------
km({ "n","v" }, "S", "<nop>")
km("v", "S\"", "di\"\"<esc>P", { desc = "Surround w/ \"\"" })
km("v", "Sq", "di\"\"<esc>P", { desc = "Surround w/ \"\"" })
km("v", "S'", "di''<esc>P", { desc = "Surround w/ ''" })
km("v", "SQ", "di''<esc>P", { desc = "Surround w/ ''" })
km("v", "S`", "di``<esc>P", { desc = "Surround w/ ``" })
km("v", "SB", "di``<esc>P", { desc = "Surround w/ ``" })
km("v", "S<", "di<><esc>P", { desc = "Surround w/ <>" })
km("v", "St", "di<><esc>P", { desc = "Surround w/ <>" })
km("v", "S>", "di</><esc>P", { desc = "Surround w/ </>" })
km("v", "ST", "di</><esc>P", { desc = "Surround w/ </>" })
km("v", "S{ ", "di{}<esc>P", { desc = "Surround w/ { }" })
km("v", "S<leader>{", "di{  }<esc>hP", { desc = "Surround w/ {  }" })
km("v", "S(", "di()<esc>P", { desc = "Surround w/ ()" })
km("v", "S[", "di[]<esc>P", { desc = "Surround w/ []" })
km("v", "S<leader>[", "di[  ]<esc>hP", { desc = "Surround w/ [  ]" })
km("v", "Sl", "di[[]]<esc>hP", { desc = "Surround w/ [[]]" })
km("v", "S<leader>l", "di[[  ]]<esc>hhP", { desc = "Surround w/ [[  ]]" })
km("v", "S<leader>L", "di[[  ]];<esc>hhP", { desc = "Surround w/ [[  ]];" })
km("v", "S*", "di**<esc>P", { desc = "Surround w/ **" })
km("v", "S_", "di__<esc>P", { desc = "Surround w/ __" })
km("v", "Si", "di__<esc>P", { desc = "Surround w/ __" })
km("v", "Sb", "di****<esc>hP", { desc = "Surround w/ ****" })
km("v", "SI", "di_****_<esc>hhP", { desc = "Surround w/ _****_" })
km("v", "SB", "di_****_<esc>hhP", { desc = "Surround w/ _****_" })
