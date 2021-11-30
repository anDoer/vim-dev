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

set undodir=~/.local/share/nvim/undodir		" store all changes in this directory 
set undofile 

if !isdirectory($HOME."/.local/share/nvim/swap")
    call mkdir($HOME."/.local/share/nvim/swap", "p", 0700)
endif
set directory=~/.local/share/nvim/swap		" directory for swap files 
"set noswapfile					" we don't want to have a swap file
set nobackup					" Immediately delete backup file, we can use undofiles to restore changes
set hidden					" we can change buffers if file is not saved 

