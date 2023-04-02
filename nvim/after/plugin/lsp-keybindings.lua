local keymap = function(keys, func, desc, bufnr)
	vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

local keymaps = {
	{
		keys = "gd",
		func = function()
			vim.lsp.buf.definition()
		end,
		desc = "Go to definition",
	},
	{
		keys = "K",
		func = function()
			vim.lsp.buf.hover()
		end,
	},
	{
		keys = "<leader>ws",
		func = function()
			vim.lsp.buf.workspace_symbol()
		end,
		desc = "Workspace symbols",
	},
	{
		keys = "<leader>of",
		func = function()
			vim.diagnostic.open_float()
		end,
		desc = "Open diagnostic float",
	},
	{
		keys = "[d",
		func = function()
			vim.diagnostic.goto_next()
		end,
		desc = "Diagnostic go to next",
	},
	{
		keys = "]d",
		func = function()
			vim.diagnostic.goto_prev()
		end,
		desc = "Diagnostic go to prev",
	},
	{
		keys = "<leader>ca",
		func = function()
			vim.lsp.buf.code_action()
		end,
		desc = "Code action",
	},
	{
		keys = "<leader>gr",
		func = function()
			vim.lsp.buf.references()
		end,
		desc = "Go to references",
	},
	{
		keys = "<leader>rn",
		func = function()
			vim.lsp.buf.rename()
		end,
		desc = "Rename",
	},
	{
		keys = "<leader>l",
		func = function()
			vim.lsp.buf.format({ async = true })
		end,
		desc = "Format",
	},
}

function CreateLSPKeybindings(bufnr)
	for _, value in ipairs(keymaps) do
		keymap(value.keys, value.func, value.desc, bufnr)
	end
end

