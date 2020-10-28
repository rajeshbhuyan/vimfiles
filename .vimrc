set nocompatible
let s:cpo_save=&cpo
set cpo&vim
let &cpo=s:cpo_save
unlet s:cpo_save
set nu
set showcmd
set history=200
set backspace=indent,eol,start
set autoindent
set smartindent
set expandtab
set cedit=
set fileencodings=ucs-bom,utf-8,latin1
syntax on
filetype on
syntax enable
if has('mouse')
   set mouse=a
endif
filetype plugin indent on
au BufNewFile,BufRead *.sv set ft=verilog_systemverilog
set guifont=Monospace\ 12
set hlsearch
set incsearch
set mouse=a
set shiftwidth=3
set tabstop=3
set termencoding=utf-8
set viminfo='20,\"50,h
colorscheme desert "morning
