syntax on 
set number				" Line numbers 
set relativenumber		" relative line numbers
set linebreak			" break entire word in new line
set showmode			" displays current mode 
set scrolloff=5			" keep cursor a little bit higher while scrolling
set mouse=a				" enables scrolling with mouse and tmux 
set lazyredraw			" less redraws for macros 
set cursorline			" highlight current line 
set updatetime=300		" faster refresh rate 
set laststatus=2		" always display status bar 
set cmdheight=2			" more space for status messegases
set nowrap				" disables wrap, can be enables with Leader w
set splitbelow 
set splitright 
set noequalalways       " Disables resizing windows to a unique size, if a window was closed (very annoying)

"clipboard
set clipboard^=unnamed,unnamedplus

" Tab configuration
set tabstop=4			" how many spaces does a tab have 
set shiftwidth=4		"
set softtabstop=4		"
set expandtab			" convert tabs into spaces 
set formatoptions+=j	" Convert tabs into spaces



" configure search 
set path+=**		" we can search sub folders by using :find 
set ignorecase 		" no case-sensitivity
set smartcase		" except you search with big letters

" Backup, Swap and co 
if !isdirectory($HOME."/.local/share/nvim/undodir")
    call mkdir($HOME."/.local/share/nvim/undodir", "p", 0700)
endif

set undodir=~/.local/share/nvim/undodir/	" store all changes in this directory 
set undofile 

if !isdirectory($HOME."/.local/share/nvim/swap")
    call mkdir($HOME."/.local/share/nvim/swap", "p", 0700)
endif
set directory=~/.local/share/nvim/swap		" directory for swap files 
"set noswapfile					" we don't want to have a swap file
set nobackup					" Immediately delete backup file, we can use undofiles to restore changes
set hidden					" we can change buffers if file is not saved 

" Lightline colorscheme + Vista in status bar 
let g:lightline = {             
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['cocstatus', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Optimize internal file manager (Explore, VExplore, SExplore) 
let g:netrw_banner = 0          " disable banner
let g:netrw_browse_split = 4    " open in same window
let g:netrw_altv = 1            " open split right hand side 
let g_netrw_liststyle = 3       " Tree view 
let g:netrw_winsize = 25        " smaller window 
let g:netrw_list_hide = netrw_gitignore#Hide()    " ignore git 
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'     " ignore dot files 

let vim_markdown_preview_github = 1         " Show markdown github extension

" NerdTree configuration 
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0 

" COC configuration
" automatically install COC extensions 
let g:coc_global_extensions = [
      \'coc-snippets',
      \'coc-prettier',
      \'coc-jedi',
      \'coc-highlight',
      \'coc-eslint',
      \'coc-json', 
      \'coc-git',
      \]

" coc-highlight - Gleiche Wörter im Code markieren
autocmd CursorHold * silent call CocActionAsync('highlight')
" Zeigt Fehler mit Markierung der Zeile an und Fehlercode, wenn man auf der Zeile steht
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Mit :Format wird der Code automatisch formatiert
command! -nargs=0 Format :call CocAction('format')

" Configuration of indentLine
let g:indentLine_setColors = 0  " do not override colors of colorscheme


 " Call method on window enter 
" augroup WindowManagement
"     autocmd! 
"     autocmd WinEnter * call Handle_Win_Enter()
" augroup end 

"hi ActiveWindow guibg=#000000
"hi InactiveWindow guibg=#0D1B22
"
" function! Handle_Win_Enter()
"     setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" endfunction
