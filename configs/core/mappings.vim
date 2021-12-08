" remap leader key 
nnoremap <Space> <nop>
let mapleader = " "	

" disable arrow keys 
nnoremap <Left> :echo "No left key!"<CR>
nnoremap <Right> :echo "No right key!" <CR>
nnoremap <Up> :echo "No up key!" <CR>
nnoremap <Down> :echo "No down key!" <CR>

vnoremap <Left> <Esc> :echo "No left key!"<CR>
vnoremap <Right> <Esc> :echo "No right key!" <CR>
vnoremap <Up> <Esc> :echo "No up key!" <CR>
vnoremap <Down> <Esc> :echo "No down key!" <CR>

" enable / disable wrap 
nnoremap <Leader>w :set wrap! <CR>

" Buffer Navigation
nnoremap <silent> <leader>k :bp!<CR>
nnoremap <silent> <leader>j :bn!<CR>

" Open files and last session
nnoremap <leader>S :LoadLastSession<CR>
map <silent> <leader>o :call NERDTreeToggle()<CR>

" Moving of lines up and down
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==
inoremap <C-A-j> <Esc>:m .+1<CR>==gi
inoremap <C-A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv

" Shift + Tab for inverse shift 
nnoremap <Tab> >>
nnoremap <S-Tab> << 
inoremap <S-Tab> <C-d>

" Navigation through splits
nnoremap ,v :vsplit<CR>      " creates vertical split 
nnoremap ,h :split<CR>       " creates horizontal split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Navigate through buffers 
nnoremap <silent> <leader>k :bp!<CR>
nnoremap <silent> <leader>j :bn!<CR>

" Resizing splits 
nnoremap <silent> ,+ :vertical resize +5<CR>
nnoremap <silent> ,- :vertical resize -5<CR>
nnoremap <silent> ,* :resize +5<CR>
nnoremap <silent> ,_ :resize -5<CR>
nnoremap ,= <C-w>=

" copy, cut and paste 
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" file history 
nnoremap <leader>u :UndotreeToggle<CR>

" COC Bindings

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)   " Anpassung für deutsche Tastatur
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
