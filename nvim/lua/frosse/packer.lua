local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer"
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-commentary' }
  use {'tpope/vim-surround'}
  use {'alvan/vim-closetag'}
  use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }

  use { 'ellisonleao/glow.nvim' }

  use { 'SirVer/ultisnips' }
  use {'honza/vim-snippets'}
  use {'epilande/vim-react-snippets'}

  use {'leafgarland/typescript-vim'}
  use {'ianks/vim-tsx'}
  use {'maxmellon/vim-jsx-pretty'}

  use {'jiangmiao/auto-pairs'}

  use {'morhetz/gruvbox'}
  use {'mofiqul/dracula.nvim'}
  use {'arzg/vim-colors-xcode'}
  use {'sainnhe/everforest'}
  use {'arcticicestudio/nord-vim'}
  use {'cocopon/iceberg.vim'}
  use {'NLKNguyen/papercolor-theme'}
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
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

-- Rust
  use 'simrat39/rust-tools.nvim'

-- SQL
  use 'nanotee/sqls.nvim'

-- Formatting
  use 'sbdchd/neoformat'

-- Unit test
  use 'vim-test/vim-test'
  use {'rcarriga/vim-ultest', run = ':UpdateRemotePlugins' }

  use 'folke/which-key.nvim'

  use 'lewis6991/gitsigns.nvim'

  use 'sindrets/diffview.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
