Group = vim.api.nvim_create_augroup
Auto = vim.api.nvim_create_autocmd

local yank_group = Group('HighlightYank', {})
Auto('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

local lul = Group('lul', {})
Auto('LspAttach', {
	group = lul,
	callback = function(e)
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = e.buf, desc = "Go to definition" })
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = e.buf, desc = "Hovering definition buf" })
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = e.buf, desc = "View workspace symbols" })
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = e.buf, desc = "View code actions" })
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = e.buf, desc = "View references" })
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = e.buf, desc = "Rename" })
		vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, { buffer = e.buf, desc = "Signature help (?)" })
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = e.buf, desc = "Open floating diagnostic" })
		vim.keymap.set("n",  "[d", function() vim.diagnostic.goto_next() end, { buffer = e.buf, desc = "Next diagnostic" })
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = e.buf, desc = "Previous diagnostic" })
	end
})

-- Redo (go down undotree)
Auto({ "BufEnter", "BufNewFile" }, {
	group = lul,
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "" then
			vim.keymap.set("n", "U", "<C-R>", { noremap = true, buffer = true, desc = "Redo" })
		end
	end,
})

-- Toggle opening file from netrw in current or split buffer if netrw full is full screen
-- autocmd('FileType', {
-- 	pattern = 'netrw',
-- 	callback = function()
-- 		if vim.fn.winnr('$') == 1 then
-- 			vim.g.netrw_browse_split = 0
-- 		else
-- 			vim.g.netrw_browse_split = 4
-- 		end
-- 	end,
-- })

--
Group("SpellOff", { clear = true })
Auto("BufEnter", {
	group = "SpellOff",
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "" then
			vim.opt_local.spell = true
		else
			vim.opt_local.spell = false
		end
	end,
})

-- No spell checking on Term mode
Auto("TermOpen", {
	group = "SpellOff",
	pattern = "*",
	callback = function()
		vim.opt_local.spell = false
	end
})

--- Make trailing spaces only visible when not in insert mode
local listchars_group = Group('DynamicListChars', { clear = true })
Auto('InsertEnter', {
  group = listchars_group,
  pattern = '*',
  callback = function()
    vim.opt.listchars:remove("trail")
  end,
})
Auto('InsertLeave', {
  group = listchars_group,
  pattern = '*',
  callback = function()
    vim.opt.listchars:append("trail:▒")
  end,
})
