local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'justinmk/vim-dirvish'
  use 'w0ng/vim-hybrid'

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

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
vim.cmd([[
  colorscheme hybrid
  set termguicolors
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


-- lsp
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.on_attach = on_attach

    server:setup(opts)
end)

