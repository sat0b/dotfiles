call plug#begin('~/.vim/plugged')
    Plug 'Lokaltog/powerline'
    Plug 'w0ng/vim-hybrid'
    Plug 'fatih/vim-go'
    Plug 'rust-lang/rust.vim'
call plug#end()

filetype plugin on

syntax on

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smarttab
set laststatus=1
set hlsearch

set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo

set history=10000

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

set pastetoggle=<f5>

"file
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif


" vimdiff
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

set wildmenu
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

let $PATH = "~/.pyenv/shims:".$PATH

set backspace=indent,eol,start
set cm=blowfish2
