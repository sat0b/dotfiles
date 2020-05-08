" Plug
call plug#begin('~/.vim/plugged')
    Plug 'mhinz/vim-startify'
    Plug 'yuki-ycino/fzf-preview.vim'
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
    Plug 'ferrine/md-img-paste.vim'
    Plug 'godlygeek/tabular'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'dbridges/vim-markdown-runner'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mechatroner/rainbow_csv'
    Plug 'tpope/vim-eunuch'
    Plug 'eugen0329/vim-esearch'
    Plug 'airblade/vim-rooter'
    Plug 'vim-jp/vimdoc-ja'
    Plug 'glidenote/memolist.vim'
    Plug 'itchyny/lightline.vim'
call plug#end()

" Basic
filetype plugin on
syntax on


set encoding=UTF-8
set background=dark
set noignorecase
set smartcase
set expandtab
set shiftwidth=4
set autoindent
set smarttab
set smartindent
set laststatus=1
set hlsearch
set clipboard=unnamed
set wrapscan
set wildmenu
set wildmode=longest:list,full
set showmatch

autocmd BufEnter * silent! lcd %:p:h

set tabstop=4
augroup HTML_2_INDENT
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
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

map <C-Tab> gt
map <C-S-Tab> gT

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <leader>c :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>

set pastetoggle=<f5>

set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
let $PATH = "~/.pyenv/shims:".$PATH

set backspace=indent,eol,start

if !has('nvim')
  setlocal cm=blowfish2
end

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
let g:vim_markdown_autowrite = 1
let g:vim_markdown_new_list_item_indent = 4
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"

" md-img-paste.vim
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

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

" startify
let g:startify_files_number = 20
let g:startify_bookmarks = ['~/.vimrc']
let g:startify_custom_header = []

" memolist
let g:memolist_path = "~/notes"
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "md"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_template_dir_path = '~/.config/nvim/memolist_template/'

" lsp
setlocal omnifunc=lsp#complete
setlocal signcolumn=yes
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gr <Plug>(lsp-rename)
inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"

let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

augroup LspAutoFormatting
    autocmd!
    autocmd BufWritePre *.py LspDocumentFormatSync
augroup END
