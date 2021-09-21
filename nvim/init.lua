vim.cmd(':so $HOME/.config/nvim/old_config.vim')

local nvim_lsp = require'lspconfig'
local map = vim.api.nvim_set_keymap

local on_attach = function(client)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
end
-- Lsp setups
-- Rust
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
})


-- Typescript/Javascript
nvim_lsp.tsserver.setup({
  on_attach = require'compe'.on_attach,
})

-- Go
nvim_lsp.gopls.setup({
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})
