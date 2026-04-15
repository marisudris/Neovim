return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "c",
      "php",
      "javascript",
      "typescript",
      "html",
      "css",
    },
    highlight = {
      enable = true,
    },
  },
}
