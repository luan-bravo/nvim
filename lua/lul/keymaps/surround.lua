-------------------
-- Surround Text --
-------------------
-- first second third
vim.keymap.set({ "n","v" }, "s", "<nop>")
vim.keymap.set({ "n","v" }, "S", "<nop>")

local surrounding_pairs = {
	{"\"\"", "\""},
	{"\"\"", "q"},
	{"''", "'"},
	{"''", "Q"},
	{"``", "`"},
	{"``", "c"},

	{"<>", "<"},
	{"<>", "t"},
	{"</>", ">"},
	{"</>", "T"},

	{"{}", "{"},
	{"{  }", "<space>{"},

	{"()", "("},

	{"[]", "["},
	{"[[]]", "l"},
	{"[  ]", "<space>["},
	{"[[  ]]", "<space>l"},
	{"[[  ]];", "<space>L"},

	{"**", "*"},
	{"__", "_"},
	{"__", "i"},
	{"****", "b"},
	{"_****_", "I"},
	{"_****_", "B"},
	{"~~", "~"},
	{"  ", "  "},
	{"%%", "%"},
	{"%{%}", " %"}
}

for _, p in ipairs(surrounding_pairs) do
	local pair = p[1] -- Pair to surround the text with

	local trigger = p[2] --  Pair's trigger key
	if (trigger == "") then trigger = pair end

	local middle = 0 -- pair's index where text should be inserted

	-- Padding for inserting to be surrounded text centralized to the
		-- surrounding text
	-- If even length  (`x < 1` to account for auto float casting)
	if ((#pair % 2) < 1) then
		middle = (#pair/2)
	else
		middle = (#pair/2)+1
	end

	-- print("middle: "..middle)
	-- print("pair: "..pair)
	-- print("#pair: "..#pair)
	-- print("#pair is even: "..#pair % 2 + 1)

	local padding = string.rep("h", middle) -- 'h's to move towards the center_i of the string
	-- print("padding: "..padding)

	-- TODO: Make surround toggle if already surrounded by `pair`
	-- if (cword[1:#half_1] == half_1 && cword[#half_2:-1] == half_2) then
	-- 	sed half_1 .* half_2 / \1b
	-- else
	-- 	surround
	-- end
	-- local half_1 = pair
	-- local half_2 = pair

	local desc = "Surround text w/ "..pair

	-- TODO: if last selected char is a \n, add an "h" at the beggining of the pattern to 
	local correct_eol = ""
	-- if [selection][-1] == '\n' then correct_eol = "h" end

	-- TODO: simplify patterns and create a loop to finish making them
	-- local vPattern = "c"..pair.."<Esc>"..pad.."P"
	-- local nwPattern = "viwc"..pair.."<Esc>"..pad.."P"
	-- local nWPattern = "viWc"..pair.."<Esc>"..pad.."P"
	local selection = {
		visual = "",
		normal_word = "viw",
		normal_Word = "viW",
	}
	local clip = "\"zc"

	-- auto complete patterns
	for key, sclt in pairs(selection) do
		-- print("cuts[key]: "..cuts[key])
		if slct ~= "" or slct ~= nil then
			selection[key] = correct_eol..sclt..clip..pair.."<Esc>"..padding.."p"
		else
			selection[key] = sclt..clip..pair.."<Esc>"..padding.."p"
		end
		-- print("new cuts[key]: "..cuts[key])
	end


	-- TODO: refactor to function to implement correct_eol feature
	-- vim.fn.getreg('<register>')

	--- Generate surround keymaps
	-- TODO: Fix it for v-line mode (works great with )
	vim.keymap.set("v", "s"..trigger, selection.visual,
		{ desc = desc } )
	vim.keymap.set("v", "S"..trigger, selection.visual,
		{ desc = desc } )

	vim.keymap.set("n", "s"..trigger, selection.normal_word,
		{ desc = desc } )
	vim.keymap.set("n", "S"..trigger, selection.normal_Word,
		{ desc = desc } )
end
