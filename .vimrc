" Plug
call plug#begin('~/.vim/plugged')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Lokaltog/powerline'
    Plug 'w0ng/vim-hybrid'
    Plug 'fatih/vim-go'
    Plug 'rust-lang/rust.vim'
    Plug 'godlygeek/tabular'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'plasticboy/vim-markdown'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'mattn/vim-lsp-settings'
    Plug 'ryanolsonx/vim-lsp-python', {'for' : 'python'}
    Plug 'ryanolsonx/vim-lsp-javascript', {'for' : ['javascript', 'javascript.jsx']}
call plug#end()

" Basic
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

set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

set pastetoggle=<f5>

set wildmenu
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
let $PATH = "~/.pyenv/shims:".$PATH

set backspace=indent,eol,start
set cm=blowfish2


" File
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

" Vimdiff
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

" vim markdown
set nofoldenable

" lsp
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:ycm_auto_trigger = 1
 
function! s:configure_lsp() abort
    setlocal omnifunc=lsp#complete
    nnoremap <buffer> gd :<C-u>LspDefinition<CR>
    nnoremap <buffer> gD :<C-u>LspReferences<CR>
    nnoremap <buffer> K  :<C-u>LspHover<CR>
endfunction

let g:lsp_diagnostics_enabled = 0
