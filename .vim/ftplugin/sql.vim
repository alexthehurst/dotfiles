" Guess the currently connected database by searching for open connections with
" the current username, and grab the first one. Then query to that.
"
" Only works for local DBs.
"
" Send vimpipe commands there, if the filetype is SQL.
"
" Works with https://github.com/krisajenkins/vim-pipe

let b:vimpipe_command="psql --no-psqlrc -d `psql --command=\"SELECT datname FROM pg_stat_activity WHERE (usename='$USER' AND NOW() - backend_start > '5 seconds') LIMIT 1\" --tuples-only` "

" Postgres output syntax highlighting, works with
" https://github.com/krisajenkins/vim-postgresql-syntax.git
let b:vimpipe_filetype="postgresql"


" In sql files, reformat the whole file or the current selection with leader-sf.
" pip install sqlparse
" https://pypi.python.org/pypi/sqlparse/0.2.0
vnoremap <leader>sf :'<,'>!sqlformat -k upper -asr --indent_width 4 -<CR>:%!sed '/^\s*$/d'<CR>
nnoremap <leader>sf :%!sqlformat -k upper -asr --indent_width 4 -<CR>:%!sed '/^\s*$/d'<CR>
