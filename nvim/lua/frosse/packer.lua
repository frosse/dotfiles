vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"
  use "williamboman/mason.nvim"

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-commentary' }
  use {'tpope/vim-surround'}
  use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }


  use { 'SirVer/ultisnips' }
  use {'honza/vim-snippets'}
  use {'epilande/vim-react-snippets'}


  use {'catppuccin/nvim', as = 'catppuccin'}
  use 'Mofiqul/vscode.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

-- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-project.nvim'

-- LSP

  use 'folke/which-key.nvim'

  use 'lewis6991/gitsigns.nvim'

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
