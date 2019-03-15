" This is a hack to make list indenting work correctly. The behavior it
" relies on is probably a half-broken feature in vim-markdown.
nnoremap o A<Enter>
nnoremap O kA<Enter>

" I don't care about header folding as much as list folding
set foldmethod=indent
let g:vim_markdown_folding_disabled = 1

" I don't want my lists, code, and paragraphs to be folded by default.
set foldlevel=1000

nnoremap <Leader>ft :TableFormat<Enter>

nnoremap <Leader>wc :w !wc -w<Enter>

nnoremap <Leader><Leader> :InvertCheckboxes<Enter>

setlocal com^=b:-\ []
setlocal com-=b:>
