-- Global aliases
--- vim.keymap.set
Km = vim.keymap.set

--- vim.api.nvim_create_augroup
Group = vim.api.nvim_create_augroup
--- vim.api.nvim_create_autocmd
Autocmd = vim.api.nvim_create_autocmd

--- vim.api.nvim_create_user_command
Command = vim.api.nvim_create_user_command
--- @param path string
--- @return nil
EditOnNewTab = function (path)
	vim.cmd("tabnew")
	vim.cmd("tcd " .. path)
	-- TODO: figure why was this *here* and make it work with oil.nvim
	local tree = PRequire("nvim-tree")
	if tree ~= nil then
		-- TODO: Make it open full screen to not open in a Vsplit and also
		-- create a empty buffer
		vim.cmd("NvimTreeOpen")
	else
		vim.cmd("Explore")
	end
end

--- for key, value in ipairs(table2) do table1[key] = value end
--- @param table1 table
--- @param table2 table
--- @return nil
FuseTables = function(table1, table2)
	if table1 == nil then
		vim.notify_once("[FuseTable] ERROR: Table 1 is nil", vim.log.levels.ERROR)
		return
	end
	for key, value in ipairs(table2) do table1[key] = value end
end

--- Push all items from arr1 to the end of arr2
--- @param arr1 table
--- @param arr2 table
InsertArr = function (arr1, arr2)
	table.move(arr1, 1, #arr1, #arr2 + 1, arr2) -- Fuse table $1's items with $4
end

--- Protected require (pcall or vim.notify ERROR)
--- @param module string
--- @return table|nil
PRequire = function(module)
	local ok, mod = pcall(require, module)
	if not ok then
        vim.notify_once("ERROR: Failed to require '"..module.."'".."\n\n"..tostring(mod),
			vim.log.levels.ERROR)
		return nil
	end
	return mod
end


--- Push all items from arr1 to the end of arr2
--- @param arr1 table
--- @param arr2 table
--- @return nil
PushArray = function (arr1, arr2)
	table.move(arr1, 1, #arr1, #arr2 + 1, arr2)
end
