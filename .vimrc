set nocompatible

let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum=1
let g:tern_map_prefix=']'
let g:tern_map_keys=1

let g:pathogen_disabled=[]
let g:pathogen_blacklist=g:pathogen_disabled
call pathogen#infect()
call pathogen#helptags()

let g:nerdtree_tabs_open_on_console_startup=1
let mapleader = "["

nnoremap <leader>tf :NERDTreeFocusToggle<cr>
nnoremap <leader>tt :NERDTreeTabsToggle<cr>

" cedit specifies the key to open the cmd-line window
" default is ^f, but I tend to accidentally hit that
set cedit=^w
set laststatus=2
set autoindent
set expandtab tabstop=2 shiftwidth=2
set number
set nowrap
set noruler
syntax on
filetype plugin on

