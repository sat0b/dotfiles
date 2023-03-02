call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'romainl/vim-qf'
  Plug 'simeji/winresizer'

  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-grepper'
  Plug 'vim-scripts/vim-auto-save'
  Plug 'houtsnip/vim-emacscommandline'
  Plug 'tpope/vim-eunuch'
  Plug 'justinmk/vim-dirvish'
  " Plug 'svermeulen/vim-yoink'

  " theme
  Plug 'dracula/vim', { 'as': 'dracula' }
  " search
  Plug 'eugen0329/vim-esearch'
  Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
  " Plug 'nvim-telescope/telescope.nvim'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'idanarye/vim-merginal'
  Plug 'rbong/vim-flog'

  " language
  Plug 'plasticboy/vim-markdown'

  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

  " comment
  Plug 'numToStr/Comment.nvim'

  " status
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " copilot
  " Plug 'github/copilot.vim'

  " firebase
  Plug 'delphinus/vim-firestore'

call plug#end()

" theme
set termguicolors
colorscheme dracula

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|ios/Pods'

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

" " telescope
" nnoremap <leader>tf <cmd>Telescope find_files<cr>
" nnoremap <leader>tg <cmd>Telescope live_grep<cr>
" nnoremap <leader>tb <cmd>Telescope buffers<cr>
" nnoremap <leader>th <cmd>Telescope help_tags<cr>
