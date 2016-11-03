" Vim syntax file
" Language: Jira Text Formatting Notation 
" Maintainer: Michael Feyder feydermREMOVEME@gmail.com 
" Latest Revision: 14 July 2016
" https://gist.github.com/feyderm/4b0e122b395158fe0aa8700a229c70df

if exists("b:current_syntax")
  finish
endif

" highlights headers regardless of level
syn match header '^h[1-6]\..*'

" text emphasis
syn match bold '\W\*.*\*\W'
syn match italics '\W_.*_\W'
syn match monospace '{{.*}}'

" highlights markdown notation by level
syn match level1 '^[\*#]'
syn match level2 '^[\*#]\{2}'
syn match level3 '^[\*#]\{3}'
syn match level4 '^[\*#]\{4}'
syn match level5 '^[\*#]\{5}'

let b:current_syntax = "jmd"

hi def link header     Todo
hi def link bold       Tag
hi def link italics    Tag
hi def link level1     Include
hi def link level2     Conditional
hi def link level3     Underlined
hi def link level4     StorageClass 
hi def link level5     String 

set textwidth=0
