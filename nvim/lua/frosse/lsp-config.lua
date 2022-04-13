-- LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require'lspconfig'
local map = vim.api.nvim_set_keymap
local cmp = require'cmp'
local lspkind = require('lspkind')
local configs = require 'lspconfig/configs'

local on_attach = function(_)
  map("n", "K", vim.lsp.buf.hover, {buffer=0})
  map("n", "gd", vim.lsp.buf.definition, {buffer=0})
  map("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  map("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  map("n", "gr", vim.lsp.buf.references, {buffer=0})
  map("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
  map("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
  map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
  map("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  map("n", "<leader>ga", vim.lsp.buf.code_action, {buffer=0})
  end

nvim_lsp.rust_analyzer.setup({
  capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
})

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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

if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = {'golangci-lint-langserver'},
      root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
      }
    };
  }
end

nvim_lsp.sqls.setup({
    on_attach = function(client, bufnr)
      on_attach()
      map("v", "<leader>qr", "<cmd>SqlsExecuteQuery<cr>", {buffer=0})
      map("v", "<leader>qv", "<cmd>SqlsExecuteQueryVertical<cr>", {buffer=0})
      map("n", "<leader>qc", "<cmd>SqlsSwitchConnection<cr>", {buffer=0})
      require('sqls').on_attach(client, bufnr)
    end,
    capabilities = capabilities
})

nvim_lsp.html.setup({
on_attach = on_attach,
  configurationSection = { "html", "css", "javascript"},
  embeddedLanguages = {
    css = true,
    javascript = true
  },
  provideFormatter = true
})

nvim_lsp.sumneko_lua.setup({})

require'nvim-tree'.setup({
  view = {
    side = 'right',
  }
})
