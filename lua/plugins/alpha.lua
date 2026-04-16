return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local theta = require("alpha.themes.theta")
    local dashboard = require("alpha.themes.dashboard")

    local config = theta.config

    -- Import button actions from utils/alpha-actions.lua
    local function cmd(action)
      return string.format("<cmd>lua require('utils.alpha-actions').%s()<CR>", action, action)
    end

    -- ASCII header
    config.layout[2].val = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }

    -- Button config
    for _, section in ipairs(config.layout) do
      if section.type == "group" and section.val and section.val[1] and section.val[1].val == "Quick links" then
        section.val = {
          {
            type = "text",
            val = "Quick links",
            opts = { hl = "SpecialComment", position = "center" },
          },
          { type = "padding", val = 1 },

          dashboard.button("e", "  New file", "<cmd>ene<CR>"),
          dashboard.button("f", "󰈞  Find file", cmd("find_files")),
          dashboard.button("g", "󰊄  Live grep", cmd("live_grep")),
          dashboard.button("s", "󰱽  Grep string", cmd("grep_string")),
          dashboard.button("t", "  TODOs", cmd("todos")),
          dashboard.button("c", "  Config", cmd("config")),
          dashboard.button("q", "󰅚  Quit", cmd("quit")),
        }
      end
    end

    alpha.setup(config)
  end,
}
