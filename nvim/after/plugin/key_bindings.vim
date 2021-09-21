" Key bindings
let mapleader = " "
"Plugin shortcuts
"map <C-b> :NERDTreeToggle<CR>


let g:user_emmet_mode="n"
let g:user_emmet_leader_key=","
nnoremap <leader>t :GitFiles<CR>
nnoremap <leader>b :Buffers<CR>


" LSP
nmap <leader>gd <Cmd>lua vim.lsp.buf.definition()<CR>
nmap <leader>gr <Cmd>lua vim.lsp.buf.references()<CR>
nmap <leader>rn <Cmd>lua vim.lsp.buf.rename()<CR>
nmap <leader>ga <Cmd>lua vim.lsp.buf.code_action()<CR>

nmap K <Cmd>lua vim.lsp.buf.hover()<CR>


" VIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
noremap j gj
noremap k gk
inoremap jk <Esc>
noremap <leader>t :FZF<CR>

nnoremap <C-b> :NvimTreeToggle<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
