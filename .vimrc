set nocompatible              " be iMproved, required
"filetype off                  " required

filetype plugin indent on    " required
execute pathogen#infect()

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" Better search behavior: case-insensitive for all lowercase
set ignorecase
set smartcase
set incsearch

" Keep at least this many lines on screen when possible
set scrolloff=4

syntax enable

" Spaces instead of tabs
set expandtab        " Insert spaces when hitting tab
set tabstop=4        " Display actual tabs as this width
set shiftwidth=0     " With >>, <<, default to match 'tabstop'
set softtabstop=-1   " Insert and delete this many spaces for a tab: negative defaults to shiftwidth

set background=dark

" Use relative line numbers, and show current real line number
set number
set relativenumber

set showmatch        " Highlight matching brackets/parentheses when typed
set matchpairs+=<:>  " Include angle brackets for matching

set encoding=utf-8

" Preserve indent when typing <Enter>
set autoindent

" Show when in insert, replace, or visual mode
set showmode

" Show partial command characters in last line, or size of selection
set showcmd

" Autocomplete menu style
set wildmenu
set wildmode=list:longest

" Soft word wrapping
set wrap linebreak nolist
set showbreak=⤥\ 
set cpoptions+=n  " put showbreak between line numbers

""" CURSORLINE BEHAVIOR
set cursorline

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=Black cterm=bold

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=None cterm=none



set ttyfast   " Draw faster because we have a good connection
set hidden    " Hide (don't unload) abandoned buffers

" You may backspace past whitespace, start of the line, and where you began
" insert
set backspace=indent,eol,start

" Don't check for modelines (prefs) near the start of files
set modelines=0

" Last window will always (2) have a status
set laststatus=2

" Flash the screen for bell
set visualbell

" Show lineno, logical colno, and visual colno in the status line
set ruler

" Also show last save time
set rulerformat=%55(%{strftime('%c',getftime(expand('%')))}\ %5l,%-6(%c%V%)\ %P%)

" Tilde acts as an operator, waits for a motion command before changing
set tildeop

" Very magic regexes: everything but [0-9a-zA-Z_] is a special character
nnoremap / /\v
vnoremap / /\v

" :s Replaces all matches in a line by default
set gdefault

" Normal motion on 'lines' that wrap to multiple screen lines
nnoremap j gj
nnoremap k gk

" Insert one character
:nnoremap <Space> a_<Esc>r
:nnoremap <S-Space> i_<Esc>r

" Autosave
au FocusLost * :wa

" Escape from insert mode
inoremap jk <ESC>
inoremap JK <ESC>ZZ
inoremap jj <ESC>j

let mapleader = ","

" Persist undo history to a file
set undofile
" Don't clutter things up with temporary files
set undodir=~/tmp  " Location for undo files
set dir=~/tmp      " Location for swap files

" ack
noremap <leader>a :Ack -i 
let g:ack_autofold_results = 1
let g:ackpreview = 1
let g:ackhighlight = 1
let g:ack_use_dispatch = 1

" flake8
let g:flake8_show_in_gutter=1  " show
autocmd BufWritePost *.py call Flake8()

" Python folding
set foldlevel=99
set foldmethod=indent

" Force save, even when not opened as sudo
cnoremap w!! w !sudo tee %

" gitgutter refresh time, from https://github.com/airblade/vim-gitgutter
set updatetime=250

" copy to system clipboard if compiled with +clipboard.
" (on Mac, use brew install vim.)
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed

" Accept mouse input (all modes, tweak with n,v,i,c to turn on particular modes
set mouse=a

" Use https://github.com/christoomey/vim-tmux-navigator to seamlessly switch
" between vim splits and tmux panes.
let g:tmux_navigator_no_mappings = 1
inoremap <silent> <C-a>h <C-o>:TmuxNavigateLeft<cr>
inoremap <silent> <C-a>j <C-o>:TmuxNavigateDown<cr>
inoremap <silent> <C-a>k <C-o>:TmuxNavigateUp<cr>
inoremap <silent> <C-a>l <C-o>:TmuxNavigateRight<cr>

nnoremap <silent> <C-a>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-a>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-a>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-a>l :TmuxNavigateRight<cr>

" Can't use C-a to increment numbers anymore, so do this
nnoremap <Leader>a <C-a>
nnoremap <leader>x <C-x>

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Quickly open vimrc in a vertical split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" highlight last inserted text
nnoremap gV `[v`]

" I can't stand hitting q on accident and getting thrown into macro record
" mode.
nnoremap q <Nop>
" But sometimes I need to record a macro.
nnoremap Q q

" Include my symlink to OS X user spelling dictionary
set spellfile+=~/.vim/spell/user.en.utf-8.add

" Autocompile .spl files
" http://stackoverflow.com/questions/27240638/is-there-a-quick-way-to-rebuild-spell-files-from-wordlists
for d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        exec 'mkspell! ' . fnameescape(d)
    endif
endfor

" Breakindent matches the previous indentation on wrapped lines
set breakindent
set breakindentopt+=shift:2  " Shift wrapped lines this far in, matches a bullet and space
set breakindentopt+=sbr  " Showbreak BEFORE applying additional indent

