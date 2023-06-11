augroup color_overrides
	autocmd!
	autocmd ColorScheme * highlight Normal ctermbg=NONE
augroup end

syntax on

set ignorecase
set smartcase

set hlsearch
set incsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent

set guicursor=

set virtualedit=onemore

set wildmenu
set wildmode=longest:list,full

set clipboard^=unnamed,unnamedplus

set rtp+=/usr/local/opt/fzf

set nobackup
set nowritebackup
set noswapfile

map <ScrollWheelDown> j
map <ScrollWheelUp> k
