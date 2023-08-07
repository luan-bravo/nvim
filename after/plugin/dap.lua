vim.keymap.set("n", "<F2>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<F4>", "<cmd>lua require'dap'.repl.open()<CR>")

vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")

vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>")
vim.keymap.set("n", "<F7>", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")

vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>")
