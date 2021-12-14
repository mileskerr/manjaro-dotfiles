
:set number
:set relativenumber
:set autoindent
:set mouse=a
:set smarttab
:syntax enable

:set termguicolors

noremap ; l
noremap l k
noremap k j
noremap j h

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>





call plug#begin('~/.config/nvim/plugged/')
Plug 'tpope/vim-sensible'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nekonako/xresources-nvim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()


:colorscheme xresources



