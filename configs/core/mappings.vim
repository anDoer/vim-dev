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

" Load last session
nnoremap <leader>s :LoadLastSession<CR>


" Moving of lines up and down
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==
inoremap <C-A-j> <Esc>:m .+1<CR>==gi
inoremap <C-A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv

" Navigation through splits
nnoremap ,v :vsplit<CR>      " creates vertical split 
nnoremap ,h :split<CR>       " creates horizontal split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resizing splits 
nnoremap <silent> ,+ :vertical resize +5<CR>
nnoremap <silent> ,- :vertical resize -5<CR>
nnoremap <silent> ,* :resize +5<CR>
nnoremap <silent> ,_ :resize -5<CR>
nnoremap ,= <C-w>=

