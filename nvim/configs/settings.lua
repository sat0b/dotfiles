-- esearch
vim.g.esearch = {
  name = '[esearch]',
  win_new = function(esearch) vim.cmd('noswap edit ' .. esearch.name) end,
}

-- fzf-lua
require "fzf-lua".setup { global_git_icons = false }
vim.api.nvim_set_keymap("n", "<C-\\>", '<Cmd>lua require"fzf-lua".buffers()<CR>', {})
vim.api.nvim_set_keymap("n", "<C-k>", '<Cmd>lua require"fzf-lua".builtin()<CR>', {})
vim.api.nvim_set_keymap("n", "<C-p>", '<Cmd>lua require"fzf-lua".files()<CR>', {})
vim.api.nvim_set_keymap("n", "<C-;>", '<Cmd>lua require"fzf-lua".files({ cwd = require"fzf-lua.path".git_root() })<CR>', {})
vim.api.nvim_set_keymap("n", "<C-h>", '<Cmd>lua require"fzf-lua".oldfiles()<CR>', {})
vim.api.nvim_set_keymap("n", "<C-l>", '<Cmd>lua require"fzf-lua".live_grep_glob()<CR>', {})
vim.api.nvim_set_keymap("n", "<C-g>", '<Cmd>lua require"fzf-lua".grep_project()<CR>', {})
vim.api.nvim_set_keymap("n", "<F1>", '<Cmd>lua require"fzf-lua".help_tags()<CR>', {})

