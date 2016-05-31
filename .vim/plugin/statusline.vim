" highlight colors (OSX 10.11)
" 0 - Black
" 1 - Red
" 2 - Green
" 3 - Yellow
" 4 - Blue
" 5 - Purple
" 6 - Cyan
" 7 - Gray
" 8 - DarkGray
" 9 - BrightRed
" 10 - BrightGreen
" 11 - BrightYellow
" 12 - BrightBlue
" 13 - BrightPurple
" 14 - BrightCyan
" 15 - White

highlight statusline term=NONE cterm=NONE ctermfg=15 ctermbg=0 
highlight statuslineNC term=NONE cterm=NONE

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    highlight statusline ctermfg=14
  elseif a:mode == 'r'
    highlight statusline ctermfg=13
  else
    highlight statusline ctermfg=9
  endif
endfunction

" default
autocmd InsertEnter * call InsertStatuslineColor(v:insertmode)
autocmd InsertLeave * highlight statusline ctermfg=15

" Formats the statusline
set statusline=%y\      "filetype + " "
set statusline+=%F      "full path
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

" Puts in the current git status
if count(g:pathogen_disabled, 'Fugitive') < 1   
    set statusline+=\ %{fugitive#statusline()}
endif

set statusline+=\ %=                         " align right
set statusline+=\ L:\ %5l/%-5L\ [%3p%%]      " line X of Y [percent of file]
set statusline+=\ C:\ %3c                    " current column
set statusline+=\ B:\ %2n                    " Buffer number

