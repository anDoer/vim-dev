" Installation Pluginmanager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
" Color Schemes
Plug 'morhetz/gruvbox'                  " Color Theme
Plug 'marko-cerovac/material.nvim'

" Other plugins
Plug 'preservim/nerdtree'               " File Browsers
Plug 'Xuyuanp/nerdtree-git-plugin'      " Nerdtree git plugin
Plug 'mbbill/undotree'                  " Anzeigen von alten Revisionen
Plug 'vim-scripts/SearchComplete'       " activate autocompletion in search 
Plug 'itchyny/lightline.vim'            " statusbar
Plug 'liuchengxu/vista.vim'             " show functions, variables
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'Yggdroot/indentLine'

call plug#end() " activate plugins

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

