" vnoremap <leader>ff :'<,'>!yapf<CR>
" nnoremap <leader>ff :%!yapf<CR>

let g:pymode_options_colorcolumn = 0  " I'll handle my own colorcolumn

" http://stackoverflow.com/questions/395114/vim-syntax-coloring-how-do-i-highlight-long-lines-only
highlight OverLength ctermbg=darkred ctermfg=white
match OverLength /\%80v./

nnoremap <Leader>ff :PymodeLintAuto<Enter>

" Enable pylint, default is not to include it
let g:pymode_lint_checkers = ['pep8', 'mccabe', 'pylint']

" Run the linter when the file is saved, even if no changes
let g:pymode_lint_unmodified = 1

" C0325: Unnecessary parens after keyword, like print
" I0013: Ignoring entire file due to `# pylint: skip-file`
let g:pymode_lint_ignore ='
            \ C0325,
            \ I0013,
            \ F0002, ' 

let g:pymode_rope = 0

let g:pymode_python = 'python3'

let g:pymode_lint = 0
