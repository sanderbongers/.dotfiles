augroup color_overrides
    autocmd!
    " Transparent background
    autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
augroup end

" Synchronize with system clipboard
set clipboard^=unnamed,unnamedplus

" Block style cursor in all modes
set guicursor=

" Complete first match and list all matches
set wildmode=list:full

" Enable mouse scrolling in iTerm2
map <ScrollWheelDown> j
map <ScrollWheelUp> k
