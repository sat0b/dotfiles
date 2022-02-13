vim.cmd([[
  set diffopt+=vertical
  set undofile
  set shiftwidth=4
  set shortmess+=c
  set showmatch
  set signcolumn=yes
  set smartcase
  set smartindent
  set smarttab
  set tabstop=4
  set clipboard+=unnamedplus
]])

require('plugins')
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

