set encoding=utf-8
scriptencoding utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoinstall Vundle if necessary
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vundle - the vim plugin bundler
    let g:previous_vundle_install_exists=1
    let g:vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(g:vundle_readme) 
        echo 'Installing Vundle..'
        echo ''
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
        let g:previous_vundle_install_exists=0
    endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup from https://github.com/VundleVim/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"     Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"     Plugin 'L9'
" Git plugin not hosted on GitHub
"     Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"     Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"     Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"     Plugin 'ascenator/L9', {'name': 'newL9'}

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
filetype off                  " required

set runtimepath+=~/.vim/bundle/Vundle.vim  " Add to path
call vundle#begin()  " or specify installation path: call vundle#begin('~/path')

Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'airblade/vim-gitgutter'
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

Plugin 'godlygeek/tabular'  " required for plasticboy/vim-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'python-mode/python-mode'
Plugin 'krisajenkins/vim-pipe'
Plugin 'krisajenkins/vim-postgresql-syntax'
Plugin 'tpope/vim-surround'
Plugin 'michaeljsmith/vim-indent-object'  " Text object for lines at the same indentation
Plugin 'confluencewiki.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'w0rp/ale'
let g:ale_sign_warning='●'
hi ALEErrorSign ctermfg=red ctermbg=none
let g:ale_sign_error='●'
hi ALEWarningSign ctermfg=yellow ctermbg=none

Plugin 'kana/vim-textobj-user'
" viv
Plugin 'Julian/vim-textobj-variable-segment'
" vif, vic
Plugin 'bps/vim-textobj-python'

" vi({[<t etc.
Plugin 'wellle/targets.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'file:///Users/alexhurst/projects/invert-vim'

" Identify typescript filetype
Plugin 'leafgarland/typescript-vim'

Plugin 'rjungemann/tslime.vim'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c> <Plug>SendSelectionToTmux

Plugin 'google/yapf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoinstall plugins if this is the first run
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if previous_vundle_install_exists == 0
    echo 'Installing Vundles, please ignore key map error messages'
    echo ''
    :PluginInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Vundle setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
    
" When tabs exist, show them nicely. Don't show an EOL, just a solid block for
" trailing spaces.
set listchars=tab:\|\ ,trail:█

set background=dark

" Use relative line numbers, and show current real line number
set number
set relativenumber

set showmatch        " Highlight matching brackets/parentheses when typed
set matchpairs+=<:>  " Include angle brackets for matching


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
nnoremap gk k
nnoremap gj j

" Insert one character
:nnoremap <Space> a_<Esc>r
:nnoremap <S-Space> i_<Esc>r

" Autosave
au FocusLost * :wa

" Escape from insert mode
inoremap jk <ESC>
inoremap JK <ESC>ZZ
inoremap jj <ESC>j

let g:mapleader = ','
" Escape from command-line mode (especially in a search!)
cnoremap jk <ESC>

" I keep doing this during searches, so the editor might as well be aware
cnoremap nnn <Enter>nnn


" Persist undo history to a file
set undofile
" Don't clutter things up with temporary files
set undodir=~/tmp/vim/undo  " Location for undo files
set directory=~/tmp/vim/swap      " Location for swap files

" ack
noremap <leader>a :Ack -i 
let g:ack_autofold_results = 1
let g:ackpreview = 1
let g:ackhighlight = 1
let g:ack_use_dispatch = 1

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
nnoremap <leader>ve <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Reload vimrc
nnoremap <leader>vr :source ~/.vimrc<Enter>

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
for s:d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(s:d) && (!filereadable(s:d . '.spl') || getftime(s:d) > getftime(s:d . '.spl'))
        exec 'mkspell! ' . fnameescape(s:d)
    endif
endfor

" Breakindent matches the previous indentation on wrapped lines
set breakindent
set breakindentopt+=shift:2  " Shift wrapped lines this far in, matches a bullet and space
set breakindentopt+=sbr  " Showbreak BEFORE applying additional indent

" Perform indentation the way my fingers want, even in insert mode
inoremap >> <C-t>
inoremap << <C-d>

" If spelling is off, don't display a warning. Just enable it!
nnoremap [s ms:set spell<ENTER>[s
nnoremap ]s ms:set spell<ENTER>]s
" And easily turn it off by using leader
nnoremap <leader>[s :set nospell<ENTER>`s
nnoremap <leader>]s :set nospell<ENTER>`s

" Accept the first autospell correction
nnoremap <silent> <leader>z z=1<CR><CR>

" This depends on the confluencewiki.vim plugin
au BufNewFile,BufRead *.jmd set filetype=confluencewiki
au FileType jmd set filetype=confluencewiki

" Autoclose the quickfix window if it's the last one remaining
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Mappings for jumping around in the quickfix list (by location, not error)
nnoremap [q :lprevious<Enter>
nnoremap ]q :lnext<Enter>


augroup vimrc
    " Magic from https://github.com/jez/dotfiles/blob/master/vimrc
    " Clear the current autocmd group, in case we're re-sourcing the file
    au!

" Jump to the last known cursor position when opening a file.
autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Folded ctermbg=black ctermfg=darkcyan
highlight Comment ctermfg=darkcyan

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=Black cterm=bold

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=None cterm=none


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Static Analysis
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_echo_msg_format = '%s [%linter%]'
" http://mypy.readthedocs.io/en/latest/command_line.html#follow-imports
let g:ale_python_mypy_options = '--ignore-missing-imports'

