return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "query", "bash", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
