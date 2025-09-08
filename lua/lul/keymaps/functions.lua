-- Track the messages buffer number
vim.keymap.set("n", "<leader>msg", function()
    local messages_bufnr = nil
    local noi_ok, _ = pcall(require, "noice")
    if noi_ok then
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
vim.keymap.set("n", "<leader>fl", function()
    vim.cmd("normal! 0")
    vim.fn.search("[a-zA-Z]", "c", vim.fn.line("."))
end, { noremap=true, silent=true, desc = "Go to first letter character" })


-- Go to first alphanumeric character in line
vim.keymap.set("n", "<leader>fa", function()
    vim.cmd("normal! 0")
    vim.fn.search("[a-zA-Z0-9]", "c", vim.fn.line("."))
end, { noremap=true, silent=true, desc = "Go to first alphanulmeric character" })


-- Add rare spelling
vim.keymap.set("n", "z/", function()
    vim.cmd("normal! mz")
    vim.cmd("spellrare! "  .. vim.fn.expand("<cWORD>\'"))
    vim.cmd("normal! `z")
end, { noremap = true, desc = "Add rare spelling to file", })
