" Basic
filetype plugin on
syntax on

"set mouse=a
set backspace=indent,eol,start
set backupdir=~/.vim/backup
set clipboard=unnamed
set cmdheight=2
set encoding=UTF-8
set expandtab
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set hidden
set history=10000
set hlsearch
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nobackup
set noignorecase
set nowritebackup
set pastetoggle=<f5>
set shiftwidth=4
set shortmess+=c
set showmatch
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set tabstop=4
set undodir=~/.vim/undo
set undofile
set updatetime=300
set wildmenu
set wrapscan
set laststatus=1

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <leader>c :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
inoremap <leader>tt <C-r>=strftime("%Y-%m-%d")<CR>
nnoremap <leader>tt a<C-r>=strftime("%Y-%m-%d")<CR><ESC>
cnoremap <leader>tt <C-r>=strftime("%Y-%m-%d")<CR>
nnoremap <leader>rr :Rename <C-r>%

let $PATH = "~/.pyenv/shims:".$PATH

autocmd BufEnter * silent! lcd %:p:h

augroup INDENT_2
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" File
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

autocmd FileType qf nnoremap <buffer> t <C-W><Enter><C-W>T

" Plug
call plug#begin('~/.config/nvim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'eugen0329/vim-esearch'
    Plug 'justinmk/vim-dirvish'
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-grepper'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'houtsnip/vim-emacscommandline'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-eunuch'
    Plug 'romainl/vim-qf'
    Plug 'tpope/vim-fugitive'
    Plug 'idanarye/vim-merginal'
    Plug 'tpope/vim-rhubarb'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'jiangmiao/auto-pairs'
    Plug 'plasticboy/vim-markdown'
call plug#end()

" onedark
colorscheme onedark
set termguicolors

" review
if &diff
    colorscheme onedark
endif
set diffopt+=vertical

hi DiffText   cterm=bold ctermfg=none ctermbg=none gui=none guifg=LightYellow guibg=none
hi DiffChange cterm=bold ctermfg=none ctermbg=none gui=none guifg=Blue guibg=none
hi DiffAdd    cterm=bold ctermfg=none ctermbg=none gui=none guifg=none guibg=#383c47
hi DiffDelete cterm=bold ctermfg=none ctermbg=none gui=none guifg=none guibg=#333232

nnoremap <Left> :tabp<CR>
nnoremap <Right> :tabn<CR>
nnoremap <Up> :tabs<CR>
nnoremap <Down> :windo bd<CR>

" Autosave
let g:auto_save = 0

" GitGutter
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0

highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

nmap <silent><leader>dm :let g:gitgutter_diff_base = 'origin/master'<CR> :GitGutter<CR>
nmap <silent><leader>dh :let g:gitgutter_diff_base = 'head'<CR> :GitGutter<CR>

nnoremap <C-f> <cmd>Telescope git_files<cr>
nnoremap <C-g> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <C-h> <cmd>Telescope oldfiles<cr>

" Fugitive
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

" markdown
let g:vim_markdown_folding_disabled = 1

" lsp
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  inoremap <buffer> <expr><c-f> lsp#scroll(+4)
  inoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
