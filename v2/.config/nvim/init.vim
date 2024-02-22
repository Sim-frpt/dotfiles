" PACKAGE MANAGER SETTING: PLUGINS WILL BE DOWNLOADED UNDER THE SPECIFIED DIRECTORY.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

" Color theme
Plug 'rebelot/kanagawa.nvim'

call plug#end()

" VIM OPTIONS

" Color scheme
colorscheme kanagawa 

" Set line numbers and make them relative to cursor position
set number
set relativenumber

" Briefly jump to the matching brace/paren/bracket when inserting text
set showmatch

" Set leader key
let mapleader = ","

" REMAPS

" Center the view when travelling half a screen up/down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Center the view when searching something
nnoremap n nzz
nnoremap N Nzz

xnoremap <Leader>p "_dP

