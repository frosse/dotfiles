call plug#begin()

Plug 'scrooloose/nerdtree'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhartington/nvim-typescript'
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'Quramy/tsuquyomi'
"Plug 'pangloss/vim-javascript'
" File Control / Formatting
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
"Plug 'vim-syntastic/syntastic'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" JavaScript
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Markdown
Plug 'gabrielelana/vim-markdown'

" Snippets
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-emmet', 'coc-tslint']
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'maxmellon/vim-jsx-pretty'

" Colorscheme
Plug 'morhetz/gruvbox'

call plug#end()


filetype plugin indent on
syntax on
set title
set number
set relativenumber
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

" Indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable

"Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=5

" Turn of Swap
set noswapfile
set nobackup
set nowb


" DEOPLETE
let g:deoplete#enable_at_startup = 1

" FZF configuration
let g:fzf_layout = {'down': '~20%'}

" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>

" Airline config
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set path+=**

let mapleader = ","
noremap <leader>t :FZF<CR>
inoremap jk <Esc>
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap j gj
nnoremap k gk
set t_Co=256
colorscheme gruvbox
