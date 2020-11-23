augroup php
    :nnoremap <leader>d oecho __METHOD__.':'.__LINE__."\n"; ob_flush();  // XXX: DEBUG<ESC>k
    :nnoremap <leader>D Oecho __METHOD__.':'.__LINE__."\n"; ob_flush();  // XXX: DEBUG<ESC>j
augroup END

