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
set ignorecase
set smartcase
set incsearch
set scrolloff=4
syntax enable
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set background=dark
set number
set showmatch
set encoding=utf-8
set autoindent
set showmode
set showcmd
set wildmenu
set wildmode=list:longest

" Soft word wrapping
set wrap linebreak nolist
set showbreak=•\ 

""" CURSORLINE BEHAVIOR
set cursorline

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=Black cterm=bold

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=None cterm=none



set ttyfast
set hidden
set backspace=indent,eol,start
set modelines=0
set laststatus=2
set relativenumber 
set visualbell
set ruler
set rulerformat=%55(%{strftime('%c',getftime(expand('%')))}\ %5l,%-6(%c%V%)\ %P%)
set tildeop

nnoremap / /\v
vnoremap / /\v

set gdefault

nnoremap j gj
nnoremap k gk

" Insert one character
:nnoremap <Space> a_<Esc>r
:nnoremap <S-Space> i_<Esc>r

au FocusLost * :wa
inoremap jk <ESC>
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
nnoremap <silent> <C-a>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-a>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-a>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-a>l :TmuxNavigateRight<cr>

" Quicky open vimrc in a vertical split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" highlight last inserted text
nnoremap gV `[v`]
