" remap leader key 
nnoremap <Space> <nop>
let mapleader = " "	

" reload config file 
nnoremap <leader>R :source ~/.config/nvim/init.vim
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

" Open a terminal in new split 
nnoremap <silent> <leader>T :split<CR> :term bash<CR>
tnoremap <C-A-c> <C-\><C-n>

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

" Tabs 
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tc :tabc<CR> 
" gt navigate to next tab 
" gT navigate to prev tab

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
" <Tab>: completion 
"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" : 
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)   " Anpassung für deutsche Tastatur
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion 
inoremap <silent><expr> <c-space> coc#refresh() 

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo navigation 
nmap <silent> gd <Plug>(coc-definition) 
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references) 

" Symbol renaming 
nmap <leader>rn <Plug>(coc-rename) 

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
