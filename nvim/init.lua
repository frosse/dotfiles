vim.cmd(':so $HOME/.config/nvim/old_config.vim')
require('frosse.lsp-config')
require('frosse.telescope')
require('frosse.luasnippet')

require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true } }

require("which-key").setup({})

require("gitsigns").setup({
  current_line_blame = true,
})

local wk = require("which-key")
wk.register({
  f = {
    name = "file",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Show tags" },
  },
  p = {
    name = "project",
    p = { "<cmd>Telescope project<cr>", "Projects" },
  },
  t = {
    name = "test",
    t = { "<cmd>UltestNearest<cr>)", "Test nearest"},
    T = { "<cmd>Ultest<cr>", "Test file" },
    s = { "<cmd>UltestSummaryOpen<cr>", "Summary" },
    o = { "<cmd>UltestOutput<cr>", "Show output" }
  },
  g = {
    name = "git",
    g = { "<cmd>Git<cr>", "fugitive" },
    b = { "<cmd>Gitsigns blame_line { full=true }<cr>", "blame" },
    d = { "<cmd>Gitsigns diffthis<cr>", "diff chunk" },
    D = { "<cmd>Gitsigns diffthis ~<cr>", "diff file" }
  }
}, { prefix = "<leader>" })
