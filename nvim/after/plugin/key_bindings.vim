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

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>bf <cmd>Telescope current_buffer_fuzzy_find<cr>
