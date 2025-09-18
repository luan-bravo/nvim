-- Clipboard configuration based on environment
local is_wsl = vim.fn.has("wsl") == 1 or os.getenv("WSL_DISTRO_NAME") ~= nil
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local is_linux = vim.fn.has("unix") == 1 and not (is_wsl or is_windows)
if is_wsl or is_windows then

	vim.g.clipboard = {
		name = "wslclipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
			["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
		},
		cache_enabled = 0,
	}
elseif is_linux then
	if vim.fn.executable("xclip") == 1 then
		vim.g.clipboard = {
			name = "xclip",
			copy = {
				["+"] = "xclip -selection clipboard",
				["*"] = "xclip -selection primary",
			},
			paste = {
				["+"] = "xclip -selection clipboard -o",
				["*"] = "xclip -selection primary -o",
			},
			cache_enabled = 0,
		}
	elseif vim.fn.executable("cliphist") == 1 then
		vim.g.clipboard = {
			-- name = "cliphist",
			name = "wl-clipboard-cliphist",
			copy = {
				["+"] = "cliphist store",
				["*"] = "cliphist store",
			},
			paste = {
				["+"] = "wl-paste --no-newline",
				["*"] = "wl-paste --primary --no-newline",
			},
			-- paste = {
			--	 ["+"] = "cliphist list | head -n 1 | cliphist decode",
			--	 ["*"] = "cliphist list | head -n 1 | cliphist decode",
			-- },
			-- copy = {
			--	 ["+"] = "wl-copy --foreground --type text/plain",
			--	 ["*"] = "wl-copy --foreground --primary --type text/plain",
			-- },
			cache_enabled = 0,
		}
	else
		vim.g.clipboard = {
			name = "none",
			copy = { ["+"] = "", ["*"] = "" },
			paste = { ["+"] = "", ["*"] = "" },
			cache_enabled = 0,
		}
	end
end
-- print("Current Clipboard: " .. vim.g.clipboard.name)
