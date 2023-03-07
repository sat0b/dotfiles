call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'romainl/vim-qf'
  Plug 'simeji/winresizer'
  Plug 'bronson/vim-trailing-whitespace'

  Plug 'sheerun/vim-polyglot'
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-grepper'
  Plug 'vim-scripts/vim-auto-save'
  Plug 'houtsnip/vim-emacscommandline'
  Plug 'tpope/vim-eunuch'

  " lir
  Plug 'tamago324/lir.nvim'
  Plug 'tamago324/lir-git-status.nvim'

  " theme
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'nvim-tree/nvim-web-devicons'

  " search
  Plug 'eugen0329/vim-esearch'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'idanarye/vim-merginal'
  Plug 'rbong/vim-flog'

  " language
  Plug 'plasticboy/vim-markdown'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

  " comment
  Plug 'numToStr/Comment.nvim'

  " status
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " copilot
  Plug 'github/copilot.vim'

  " firebase
  Plug 'delphinus/vim-firestore'

call plug#end()

" theme
set termguicolors
colorscheme dracula

" airline
let g:airline_theme='minimalist'

" Lua setup
lua << EOF
require('Comment').setup()
EOF

" language setting
autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

" esearch
let g:esearch = {}
let g:esearch.win_new = {esearch -> esearch#buf#goto_or_open(esearch.name, 'new')}

" Show the popup with git-show information on CursorMoved is a git revision context is hovered.
let g:GitShow = {ctx -> ctx().rev &&
  \ esearch#preview#shell('git show ' . split(ctx().filename, ':')[0], {
  \   'let': {'&filetype': 'git', '&number': 0},
  \   'row': screenpos(0, ctx().begin, 1).row,
  \   'col': screenpos(0, ctx().begin, col([ctx().begin, '$'])).col,
  \   'width': 47, 'height': 3,
  \ })
  \}
" Debounce the popup updates using 70ms timeout.
autocmd User esearch_win_config
      \  let b:git_show = esearch#async#debounce(g:GitShow, 70)
      \| autocmd CursorMoved <buffer> call b:git_show.apply(b:esearch.ctx)

nnoremap <leader>fh :call esearch#init({'paths': esearch#xargs#git_log()})<cr>

" Search in modified files only
nnoremap <leader>fm :call esearch#init({'paths': '`git ls-files --modified`'})<cr>

" Search in unmerged commits using range specification
nnoremap <leader>fu :call esearch#init({'paths': esearch#xargs#git_log('development..HEAD')})<cr>

" Search in stashed entries
nnoremap <leader>fs :call esearch#init({'paths': esearch#xargs#git_stash()})<cr>

