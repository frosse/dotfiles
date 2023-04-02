vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File browser" })

vim.keymap.set("n", "<C-b>", ":NvimTreeFindFileToggle<CR>")

-- Debugger shiet
function attach_to_debug()
	local dap = require("dap")
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Attach to the process",
			hostName = "localhost",
			port = "5005",
		},
	}
	dap.continue()
end

vim.keymap.set("n", "<leader>da", ":lua attach_to_debug()<CR>", { desc = "Attach to debugger" })
vim.keymap.set("n", "<leader>do", ":lua require('dapui').open()<CR>", { desc = "dapui: open" })
vim.keymap.set("n", "<leader>dc", ":lua require('dapui').close()<CR>", { desc = "dapui: close" })
local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F1>", dap.step_into)
vim.keymap.set("n", "<F2>", dap.step_over)
vim.keymap.set("n", "<F3>", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
