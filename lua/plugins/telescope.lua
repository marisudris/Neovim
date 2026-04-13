return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>pf",
      function() require("telescope.builtin").find_files() end,
      desc = "Find Files"
    },
    {
      "<leader>ps",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "Grep String"
    },

    {
      "<leader>pg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep"
    },
  },
  config = function()
    -- You can add extra Telescope setup here (like themes or ignored patterns)
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {},
        },
      },
    })
  end,
}
