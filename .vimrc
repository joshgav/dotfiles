" ideas from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

set nocompatible

set statusline=\ %<%F\ %y\ %m%r%h%{HasPaste()}%=line:%l\/%L,col:%c
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set laststatus=2
set showbreak=>\ 
set showmode
set number

set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab

filetype plugin on
syntax enable

" with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "["
let g:mapleader = "["

set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set backspace=indent,eol,start

set ignorecase
set smartcase
set incsearch
set hlsearch

" toggle paste mode
map <leader>pp :setlocal paste!<cr>

function! HasPaste()
  if &paste
      return '[P]'
  endif
  return ''
endfunction

let g:pathogen_disabled=[]
let g:pathogen_blacklist=g:pathogen_disabled
call pathogen#infect('~/.vim/bundle/{}')

nnoremap <leader>f :NERDTreeToggle<cr>
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
