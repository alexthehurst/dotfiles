" This is a hack to make list indenting work correctly. The behavior it
" relies on is probably a half-broken feature in vim-markdown.
nnoremap o A<Enter>
nnoremap O kA<Enter>

" I don't care about header folding as much as list folding
set foldmethod=indent
let g:vim_markdown_folding_disabled = 1

nnoremap ,ft :TableFormat<Enter>
