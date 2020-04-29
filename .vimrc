" Plug
call plug#begin('~/.vim/plugged')
    Plug 'cocopon/vaffle.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
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

" coc.vim
let g:coc_global_extensions = [ 
            \ 'coc-json', 
            \ 'coc-python', 
            \ 'coc-rls', 
            \ 'coc-go', 
            \ 'coc-tsserver', 
            \ 'coc-eslint', 
            \ 'coc-json', 
            \ 'coc-html',
            \ 'coc-yaml',
            \ 'coc-sh',
            \ 'coc-lists']
  
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-n> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

