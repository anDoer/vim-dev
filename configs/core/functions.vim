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
