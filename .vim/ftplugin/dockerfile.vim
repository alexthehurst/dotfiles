let g:syntastic_dockerfile_checkers = ['hadolint']

" Run all checkers in parallel instead of clearing one type first
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1

" Don't open loc list automatically, just on :lopen. But do close
" automatically if there are no messages.
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
