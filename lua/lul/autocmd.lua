Autocmd("TextYankPost", { pattern = "*", callback = function()
	vim.hl.on_yank({
		higroup = "IncSearch",
		timeout = 40,
	})
end })

local term = Group("TermEnter", { clear = true })
Autocmd({ "BufEnter" }, { group = term, pattern = "term://*", callback = function()
		vim.bo.spell = false
end })

-- Disable search highlighting after a substitution
-- Autocmd("CmdlineLeave", {
--     group = Group("NohlAfterSed", { clear = true }),
--     pattern = ":",
--     callback = function()
--         local cmd = vim.fn.getcmdline()
--         if cmd:match("^.*s[ubstitute]*[^a-zA-Z0-9"|\\].*") then
--             vim.cmd("nohlsearch")
--         end
--     end,
-- })
