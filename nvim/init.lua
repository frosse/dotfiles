vim.cmd(':so $HOME/.config/nvim/old_config.vim')
require('frosse.lsp-config')
require('frosse.telescope')
require('frosse.luasnippet')

require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true } }
