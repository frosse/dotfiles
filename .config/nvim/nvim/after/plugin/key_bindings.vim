" Key bindings
let mapleader = " "
"Plugin shortcuts
map <C-b> :NERDTreeToggle<CR>


let g:user_emmet_expandabbr_key = '<leader>em'
nnoremap <leader>t :GitFiles<CR>
nnoremap <leader>b :Buffers<CR>
" COC
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gy <Plug>(coc-type-definition)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gr <Plug>(coc-references)
"nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
"nmap <leader>gh <plug>(YCMHover)
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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

