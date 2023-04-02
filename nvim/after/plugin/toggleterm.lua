require("toggleterm").setup({})

vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { desc = "Toggleterm" })
