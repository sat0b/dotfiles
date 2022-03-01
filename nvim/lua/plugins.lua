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

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- formatter
  use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

  -- complete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-buffer"

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

-- snippet
vim.cmd([[
  " Expand
  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  
  " Expand or jump
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  
  " Jump forward or backward
  " imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  " smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  " imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  " smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

  " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
  " See https://github.com/hrsh7th/vim-vsnip/pull/50
  nmap        s   <Plug>(vsnip-select-text)
  xmap        s   <Plug>(vsnip-select-text)
  nmap        S   <Plug>(vsnip-cut-text)
  xmap        S   <Plug>(vsnip-cut-text)
  
  " If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
  let g:vsnip_filetypes = {}
  let g:vsnip_filetypes.javascriptreact = ['javascript']
  let g:vsnip_filetypes.typescriptreact = ['typescript']
]])

-- NERDTree
vim.cmd("nnoremap <silent><C-n> :NERDTreeToggle<CR>")

-- complete
vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})

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

-- lualine
require('lualine').setup()

-- markdown
vim.cmd("let g:vim_markdown_new_list_item_indent = 2")
vim.cmd("let g:vim_markdown_folding_disabled = 1")

