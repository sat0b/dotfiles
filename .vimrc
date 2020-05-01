" Plug
call plug#begin('~/.vim/plugged')
    Plug 'justinmk/vim-dirvish'
    Plug 'kristijanhusak/vim-dirvish-git'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'ryanolsonx/vim-lsp-javascript'
    Plug 'fatih/vim-go'
    Plug 'rust-lang/rust.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'godlygeek/tabular'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'dbridges/vim-markdown-runner'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mechatroner/rainbow_csv'
call plug#end()

" Basic
filetype plugin on
syntax on

set expandtab
set shiftwidth=4
set autoindent
set smarttab
set laststatus=1
set hlsearch
set clipboard=unnamed

set tabstop=4
augroup HTML_2_INDENT
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 tabstop=4 softtabstop=2
augroup END

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

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

" autocmd QuickFixCmdPost *grep* cwindow

" Fzf
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-l> :GitFiles<CR>

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

" Vim Markdown
set nofoldenable

" GitGutter
set updatetime=250  
let g:gitgutter_max_signs = 500  
let g:gitgutter_map_keys = 0  
let g:gitgutter_override_sign_column_highlight = 0  

highlight clear SignColumn  
highlight GitGutterAdd ctermfg=2  
highlight GitGutterChange ctermfg=3  
highlight GitGutterDelete ctermfg=1  
highlight GitGutterChangeDelete ctermfg=4  

nmap <silent><leader>dm :let g:gitgutter_diff_base = 'master'<CR> :GitGutter<CR>
nmap <silent><leader>dh :let g:gitgutter_diff_base = 'head'<CR> :GitGutter<CR>

" Fugitive
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

" lsp
setlocal omnifunc=lsp#complete
setlocal signcolumn=yes
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gr <Plug>(lsp-rename)
inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"

