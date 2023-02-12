" Basic
filetype plugin on
syntax on

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
nnoremap <leader>rr :Rename <C-r>%

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
call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'romainl/vim-qf'
    Plug 'simeji/winresizer'

    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-grepper'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'jiangmiao/auto-pairs'
    Plug 'houtsnip/vim-emacscommandline'
    Plug 'tpope/vim-eunuch'
    Plug 'justinmk/vim-dirvish'

    " color theme
    Plug 'w0ng/vim-hybrid'

    " search
    Plug 'eugen0329/vim-esearch'
    Plug 'kien/ctrlp.vim'

    " git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'idanarye/vim-merginal'
    Plug 'tpope/vim-rhubarb'

    " language
    Plug 'plasticboy/vim-markdown'

    " lsp
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    " tabline
    Plug 'kh3phr3n/tabline'

call plug#end()

" onedark
set termguicolors
set background=dark

" review
if &diff
    colorscheme hybrid
endif
set diffopt+=vertical

hi DiffText   cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=LightYellow guibg=NONE
hi DiffChange cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=LightBlue guibg=NONE
hi DiffAdd    cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#383c47
hi DiffDelete cterm=bold ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#333232

nnoremap <Left> :tabp<CR>
nnoremap <Right> :tabn<CR>
nnoremap <Up> :tabs<CR>
nnoremap <Down> :windo bd<CR>

" tab
hi TabLine cterm=NONE ctermfg=999 ctermbg=NONE
hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=NONE
hi TabLineSel cterm=NONE ctermfg=black ctermbg=999

" Autosave
let g:auto_save = 1

" GitGutter
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0

hi clear SignColumn
hi GitGutterAdd ctermfg=2
hi GitGutterChange ctermfg=3
hi GitGutterDelete ctermfg=1
hi GitGutterChangeDelete ctermfg=4

nmap <silent><leader>dm :let g:gitgutter_diff_base = 'origin/master'<CR> :GitGutter<CR>
nmap <silent><leader>dh :let g:gitgutter_diff_base = 'head'<CR> :GitGutter<CR>

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
  let g:lsp_diagnostics_enabled = 1

endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
