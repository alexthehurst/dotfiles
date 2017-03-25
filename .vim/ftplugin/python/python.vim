" vnoremap <leader>ff :'<,'>!yapf<CR>
" nnoremap <leader>ff :%!yapf<CR>

let g:pymode_options_colorcolumn = 0  " I'll handle my own colorcolumn

" http://stackoverflow.com/questions/395114/vim-syntax-coloring-how-do-i-highlight-long-lines-only
highlight OverLength ctermbg=darkred ctermfg=white
match OverLength /\%80v./
