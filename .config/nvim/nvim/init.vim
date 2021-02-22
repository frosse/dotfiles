call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'

Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'ycm-core/YouCompleteMe'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'

Plug 'morhetz/gruvbox'

"let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint', 'coc-java' ]

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

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:NERDTreeWinPos = "right"

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync


