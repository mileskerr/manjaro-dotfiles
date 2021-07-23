syntax on
set number
set showcmd
filetype indent on
set wildmenu
set showmatch
set incsearch
set hlsearch
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors

let g:Hexokinase_optInPatterns = ['full_hex,rgb,rgba,hsl,hsla,colour_names']

let g:Hexokinase_highlighters = ['backgroundfull']




"plugins

call plug#begin('~/.vim/plugged')

Plug 'sainnhe/edge'

call plug#end()

packloadall


set background=dark
colorscheme edge

