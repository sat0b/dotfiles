
require'nvim-treesitter.configs'.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  ensure_installed = {
    "bash",
    "fish",
    "c",
    "cpp",
    "css",
    "swift",
    "python",
    "tsx",
    "typescript",
    "ruby",
    "rust",
    "go",
    "markdown",
    "vim",
    "lua",
    "json",
    "yaml",
    "hcl",
    "http",
    "dockerfile",
    "diff",
  },
  highlight = {
    enable = true,
    disable = {},
  },
}
