require('plugins')
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

vim.cmd("set nu")
vim.cmd("set diffopt+=vertical")
