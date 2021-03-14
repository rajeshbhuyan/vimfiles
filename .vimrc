" To enable vim mode
set nocompatible
let s:cpo_save=&cpo
set cpo&vim
let &cpo=s:cpo_save
unlet s:cpo_save
set nu
set showcmd
set history=200
" Indentation 
set backspace=indent,eol,start
set autoindent
set smartindent
set expandtab
set cedit=
set fileencodings=ucs-bom,utf-8,latin1
" syntax 
syntax on
filetype on
filetype plugin on 
filetype plugin indent on
syntax enable
if has('mouse')
   set mouse=a
endif
filetype plugin indent on
"for systemverilog and uvm syntax uncomment this line and download the vim.tar file
" and extract vim.tar to ~/.vim directory in linux 
"au BufNewFile,BufRead *.sv set ft=verilog_systemverilog
" font selected here, for default font comment this line
set guifont=Monospace\ 12
"Search setting
set hlsearch
set incsearch
set ic
set smartcase
set mouse=a
set shiftwidth=3
set tabstop=3
set softtabstop=3
set termencoding=utf-8
set viminfo='20,\"50,h
colorscheme desert "morning
set noswapfile
set nobackup
