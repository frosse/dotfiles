-- LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local nvim_lsp = require'lspconfig'
local map = vim.api.nvim_set_keymap

local on_attach = function(client)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, {buffer=0})
  end

local nvim_lsp = require'lspconfig'

nvim_lsp.rust_analyzer.setup({
  capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
})

-- LSP autocomplete
vim.opt.completeopt={"menu", "menuone", "noselect"} -- setting vim values

-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 4 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
    })
  },
  experimental = {
    native_menu = false,
  }
})

-- Typescript/Javascript
--
nvim_lsp.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
 -- Go
nvim_lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
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

nvim_lsp.sqls.setup({
    on_attach = function(client, bufnr)
      on_attach()
      require('sqls').on_attach(client, bufnr)
    end,
    capabilities = capabilities
})

require'nvim-tree'.setup({
  view = { 
    side = 'right',
  }
})
