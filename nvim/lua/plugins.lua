local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'simeji/winresizer'
  use 'w0ng/vim-hybrid'

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/nvim-lsp-installer'},
  
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
  
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- format
  use "mhartington/formatter.nvim"

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- root
  use {
    "ahmedkhalf/lsp-rooter.nvim",
    config = function()
      require("lsp-rooter").setup {}
    end
  }

  -- formatter
  use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

  -- search
  use "eugen0329/vim-esearch"

  -- fzf
  use { "junegunn/fzf", run = ":call fzf#install()" }
  use "junegunn/fzf.vim"

  -- git
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'

  -- markdown
  use 'godlygeek/tabular'
  use 'preservim/vim-markdown'

  -- nerdtree
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
end)

-- fzf
vim.cmd("map <C-p> :Files<CR>")

-- color
vim.cmd([[
  colorscheme hybrid
  set termguicolors
  hi! clear Conceal
]])

if vim.api.nvim_win_get_option(0, "diff") then
   vim.cmd("colorscheme hybrid")
end

vim.cmd([[
  hi DiffText   cterm=bold ctermfg=none ctermbg=none gui=none guifg=LightYellow guibg=none
  hi DiffChange cterm=bold ctermfg=none ctermbg=none gui=none guifg=LightBlue guibg=none
  hi DiffAdd    cterm=bold ctermfg=none ctermbg=none gui=none guifg=none guibg=#383c47
  hi DiffDelete cterm=bold ctermfg=none ctermbg=none gui=none guifg=none guibg=#333232
]])

-- NERDTree
vim.cmd("nnoremap <silent><C-n> :NERDTreeToggle<CR>")

-- formatter
local nullls = require "null-ls" nullls.setup {
  sources = {
    nullls.builtins.formatting.prettier,
  },
}

-- lsp
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd("autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})")

-- markdown
vim.cmd("let g:vim_markdown_new_list_item_indent = 2")
vim.cmd("let g:vim_markdown_folding_disabled = 1")

