let g:config_files = [
      \ 'plugins.vim',
	  \ 'functions.vim',
      \ 'options.vim',
      \ 'mappings.vim',
      \ 'themes.vim'
      \ ]

for s:fname in g:config_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
