call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'

Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP TEST 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

call plug#end()


filetype plugin indent on
syntax on
set title
set nonumber
set norelativenumber
set history=500
set showcmd
set noshowmode
set gdefault
set gcr=a:blinkon500-blinkwait500-blinkoff500
set cursorline
set smartcase
set ignorecase
set mouse=r
set showmatch
set nostartofline
set timeoutlen=1000 ttimeoutlen=0
set fileencoding=utf-8
set wrap
set linebreak
set listchars=tab:\ \ ,trail:·
set list
set lazyredraw
set hidden
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set scrolloff=8
set sidescrolloff=15
set sidescroll=5
set noswapfile
set nobackup
set nowb
set shortmess=aFc
set path+=**
set termguicolors
set background=dark
set t_Co=256


colorscheme gruvbox
" Markdown preview
let g:mkdp_browser = 'firefox'

let NERDTreeWinPos = 'right'

let g:user_emmet_mode="n"
let g:user_emmet_leader_key=","

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.vue,*.yaml,*.html PrettierAsync

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
  \ 'path': v:true,
  \ 'buffer': v:true,
  \ 'nvim_lsp': v:true,
  \ }

lua require'lspconfig'.tsserver.setup{ on_attach=require'compe'.on_attach }

lua require'lspconfig'.rust_analyzer.setup{}

lua <<EOF
  lspconfig = require "lspconfig"
  lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
EOF

let g:nvim_tree_side = 'right'
