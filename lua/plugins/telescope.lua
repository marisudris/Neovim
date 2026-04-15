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
    {
      "<leader>st",
      "<cmd>TodoTelescope<cr>",
      desc = "Search TODOs",
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {},
        },
      },
    })
  end,
}
