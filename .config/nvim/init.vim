call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
"Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax', {'autoload':{'filetypes': ['javascript']}}
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
"Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/space-vim-dark'
Plug 'chriskempson/base16-vim'
call plug#end()

filetype plugin indent on

silent!colorscheme base16-tomorrow-night
set termguicolors
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
set mouse=a
set showmatch
set nostartofline
set timeoutlen=1000 ttimeoutlen=0
set fileencoding=utf-8
set wrap
set linebreak
set listchars=tab:\ \ ,trail:·
set list
set lazyredraw
set background=dark
set hidden

" Indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=5

" Turn of Swap
set noswapfile
set nobackup
set nowb

"hi clear CursorLine
"hi Cursorline gui=underline cterm=underline ctermfg=None guifg=None

"Match tags always config
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = { 'html' :1,'xhtml' :1,'xml' :1, 'js' :1,'javascript.jsx': 1}
" FZF configuration
let g:fzf_layout = {'down': '~20%'}
" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>

" Airline config
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '|'
"let g:airline#extensions#tabline#left_alt_sep = '?'

syntax on

set path+=**

let mapleader = ","
noremap <leader>t :FZF<CR>
inoremap jk <Esc>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap j gj

nnoremap k gk
