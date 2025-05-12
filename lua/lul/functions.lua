Command = vim.api.nvim_create_user_command

function EditOnNewTab(path)
    vim.cmd("tabnew")
    vim.cmd("tcd " .. path)

    local tree_status, _ = pcall(require, "nvim-tree")
    if tree_status then
        -- TODO: Make it open full screen to not open in a Vsplit and also create a empty buffer
        vim.cmd("NvimTreeOpen")
    else
        vim.cmd("Explore")
    end
end
Command("Configuration", function() EditOnNewTab("~/.config/nvim") end, { desc = "Open nvim config dir in a new tab with Explorer" })
Command("Notes", function() EditOnNewTab("~/notes") end, { desc = "Open my notes dir in a new tab with Explorer" })


Command("Format", function()
    vim.lsp.buf.format()
end, { desc = "Open nvim config dir in a new tab with Explorer" })

function NonLspFormat()
    local ignore = {
        gitcommit = true,
        gitrebase = true,
        diff = true,
    }
    local filetype = vim.bo.filetype
    if ignore[filetype] then return end
    -- TODO: make it unnoticeable (not move cursor & pollute undo list/tree or search history)
    vim.cmd([[normal! mz]])
    -- remove white space at EOL
    vim.cmd([[%s/\s\+$//e]])
    -- add spacing to content surrounded by curly brackets w/o spacing
    vim.cmd([[%s/{ \(\S.*\S\) }/{ \1 }/ge]])
    vim.cmd([[undojoin]])
    vim.cmd([[silent exe "normal! ggVG="]])
    vim.cmd([[undojoin]])
    vim.cmd([[normal! `z]])
    vim.cmd([[normal! zz]])
end
Command("NonLspFormat", function() NonLspFormat() end, { desc = "Format buffer minimally" })
