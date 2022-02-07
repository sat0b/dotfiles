local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'justinmk/vim-dirvish'
  use 'w0ng/vim-hybrid'

  -- fuzzy finder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- git
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'


end)

-- fzf
vim.cmd([[
  map <C-p> :Files<CR>
  nmap <leader>; :Buffers<CR>
  nmap ; :History<CR>
]])

-- color
vim.cmd("colorscheme hybrid")
vim.cmd("set termguicolors")

