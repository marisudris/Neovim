return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Toggle Explorer (cwd)",
      },
      {
        "<leader>o",
        function()
          require("neo-tree.command").execute({ toggle = true, reveal = true })
        end,
        desc = "Reveal current file",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git Explorer",
      },
    },

    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,

        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
        },

        window = {
          width = 30,
          mappings = {
            ["<space>"] = "toggle_node",
            ["l"] = "open",
            ["h"] = "close_node",
            ["<cr>"] = "open",
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
            ["R"] = "refresh",
          },
        },
      })
    end,
  },
}
