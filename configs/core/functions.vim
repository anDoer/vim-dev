" ### Sessions
" Automatisch letzte Session speichern
function! MakeSession()
  let b:sessiondir = $HOME . "/.config/nvim/sessions"
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/autosession.vim'
  exe "mksession! " . b:filename
endfunction
au VimLeave * :call MakeSession()

" Command LoadLastSession ladet die letzte gespeicherte Session
function! LoadSession()
  let b:sessiondir = $HOME . "/.config/nvim/sessions"
  let b:sessionfile = b:sessiondir . "/autosession.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
command! LoadLastSession call LoadSession()

function NERDTreeToggle()           
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0 
        NERDTreeClose
    else
        let g:nerdtree_open = 1 
        NERDTree
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
        let g:nerdtree_open = 1
    end
endfunction

autocmd VimEnter * call StartUp()       " open NerdTree, if no file is opened 

" COC: show documentation 
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
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
