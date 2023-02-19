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

  " search
  Plug 'eugen0329/vim-esearch'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'idanarye/vim-merginal'
  Plug 'tpope/vim-rhubarb'

  " language
  Plug 'plasticboy/vim-markdown'

  " tabline
  Plug 'kh3phr3n/tabline'

  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

  " status
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'

