" This is a hack to make list indenting work correctly. The behavior it
" relies on is probably a half-broken feature in vim-markdown.
nnoremap o A<Enter>
nnoremap O kA<Enter>
