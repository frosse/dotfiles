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
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint', 'coc-java' ]

"
" LSP TEST 
"
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

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

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

lua require'lspconfig'.java_language_server.setup{on_attach=require'compe'.on_attach}

