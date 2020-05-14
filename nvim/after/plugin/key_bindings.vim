" Key bindings
let mapleader = ","
" Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>


let g:user_emmet_expandabbr_key = '<leader>em'
nnoremap <leader>t :FZF<CR>
" COC
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gy <Plug>(coc-type-definition)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gr <Plug>(coc-references)

" Snippets
imap <C-l> <Plug>(coc-snippets-expand)

" VIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>



nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
noremap j gj
noremap k gk
inoremap jk <Esc>

