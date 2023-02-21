call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'romainl/vim-qf'
  Plug 'simeji/winresizer'

  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-grepper'
  Plug 'vim-scripts/vim-auto-save'
  Plug 'jiangmiao/auto-pairs'
  Plug 'houtsnip/vim-emacscommandline'
  Plug 'tpope/vim-eunuch'
  Plug 'justinmk/vim-dirvish'
  Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}
  Plug 'mhinz/vim-startify'
  Plug 'svermeulen/vim-yoink'

  " search
  Plug 'eugen0329/vim-esearch'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'idanarye/vim-merginal'
  Plug 'rbong/vim-flog'

  " language
  Plug 'plasticboy/vim-markdown'

  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

  " comment
  Plug 'numToStr/Comment.nvim'

  " status
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " theme
  Plug 'joshdick/onedark.vim'
call plug#end()

" airline
let g:airline_theme='minimalist'

" Comment
lua << EOF
require('Comment').setup()
EOF

" language setting
autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

" Yoink
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)


" Theme
set termguicolors
colorscheme onedark

