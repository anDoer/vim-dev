" remap leader key 
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
