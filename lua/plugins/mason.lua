return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {},
  config = function(_, opts)
    require("mason").setup(opts)
  end,
}
