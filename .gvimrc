" -----------------------------------------------------------------------------
" General Settings
" after copying this file run :PlugInstall  command to install the plugin then enjoy
" if :PlugInstall not worked then copy plug.vim file to ~/.vim/autoload/   
" -----------------------------------------------------------------------------

set nocompatible              " Disable compatibility with vi
filetype plugin indent on     " Enable filetype detection, plugins, and indentation
syntax on                     " Enable syntax highlighting
set encoding=utf-8            " Set encoding to UTF-8
set fileencoding=utf-8        " Set file encoding to UTF-8

" -----------------------------------------------------------------------------
" Performance Optimizations
" -----------------------------------------------------------------------------

set lazyredraw                " Don't redraw screen during macros (improves performance)
set ttyfast                   " Faster redrawing
set nocursorline              " Disable cursor line (improves performance)
set nocursorcolumn            " Disable cursor column (improves performance)
set updatetime=300            " Faster completion and git gutter updates

" -----------------------------------------------------------------------------
" Display Settings
" -----------------------------------------------------------------------------

set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set showmatch                 " Highlight matching brackets
set showmode                  " Show current mode (insert, visual, etc.)
set showcmd                   " Show partial commands in the status line
set title                     " Set the terminal title
set scrolloff=5               " Keep 5 lines above/below the cursor
set sidescrolloff=5           " Keep 5 columns to the left/right of the cursor
set wrap                      " Wrap long lines
set linebreak                 " Wrap lines at word boundaries
set breakindent               " Indent wrapped lines
set display+=lastline         " Show as much as possible of the last line

" -----------------------------------------------------------------------------
" Editing Settings
" -----------------------------------------------------------------------------

set autoindent                " Auto-indent new lines
set smartindent               " Enable smart indentation
set expandtab                 " Use spaces instead of tabs
set tabstop=4                 " Number of spaces per tab
set shiftwidth=4              " Number of spaces for auto-indentation
set softtabstop=4             " Number of spaces for tab key in insert mode
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set clipboard=unnamedplus     " Use system clipboard for yanking and pasting
set noswapfile nobackup
set autochdir

" -----------------------------------------------------------------------------
" Search and Replace
" -----------------------------------------------------------------------------

set ignorecase                " Case-insensitive search
set smartcase                 " Case-sensitive search if query contains uppercase
set incsearch                 " Incremental search (search as you type)
set hlsearch                  " Highlight search results
set gdefault                  " Apply substitutions globally by default
"Auto commands"
autocmd BufNewFile,BufRead *.v set filetype=systemverilog
autocmd BufNewFile,BufRead *.dv set filetype=dv
" -----------------------------------------------------------------------------
" Key Mappings for Faster Work
" -----------------------------------------------------------------------------

" Use space as the leader key
let mapleader = " "

" Clear search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Save and quit shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Move between buffers
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Fast saving and quitting
nnoremap <leader>s :w<CR>
nnoremap <leader>qq :q!<CR>

" Fast editing of .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Fast search and replace
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//g<Left><Left>

" -----------------------------------------------------------------------------
" Auto-Completion for Brackets and Quotes
" -----------------------------------------------------------------------------

" Auto-close brackets, quotes, etc.
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

" Smart navigation for closing brackets
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''\<Left>"
inoremap <expr> ` strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "``\<Left>"

" -----------------------------------------------------------------------------
" Snippet Support (vim-snipmate)
" -----------------------------------------------------------------------------

" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'garbas/vim-snipmate'  " Snippet engine
Plug 'MarcWeber/vim-addon-mw-utils'  " Dependency for vim-snipmate
Plug 'tomtom/tlib_vim'  " Dependency for vim-snipmate
Plug 'honza/vim-snippets'  " Collection of pre-made snippets
call plug#end()

" Configure snipMate
let g:snipMate = { 'snippet_version' : 1 }

" -----------------------------------------------------------------------------
" Custom Snippets
" -----------------------------------------------------------------------------

" SystemVerilog Snippets
autocmd FileType systemverilog inoremap <buffer> module<tab> module module_name (
autocmd FileType systemverilog inoremap <buffer> always_ff<tab> always_ff @(posedge clk or posedge rst) begin

" C++ Snippets
autocmd FileType cpp inoremap <buffer> main<tab> int main(int argc, char* argv[]) {
autocmd FileType cpp inoremap <buffer> class<tab> class ClassName {

colorscheme desert
" Ensure <Tab> works for snippet expansion
let g:snipMate = { 'snippet_version' : 1 }
imap <Tab> <Plug>snipMateNextOrTrigger
smap <Tab> <Plug>snipMateNextOrTrigger
