" Key bindings
let mapleader = " "
"Plugin shortcuts

let g:user_emmet_mode="n"
let g:user_emmet_leader_key=","

" VIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
noremap j gj
noremap k gk
inoremap jk <Esc>

nnoremap <C-b> :NvimTreeToggle<CR>

nnoremap <C-_> <cmd>lua require("frosse.telescope").current_buffer() <cr>
