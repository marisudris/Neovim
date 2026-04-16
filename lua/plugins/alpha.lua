local actions = {}

function actions.find_files()
  require("telescope.builtin").find_files()
end

function actions.live_grep()
  require("telescope.builtin").live_grep()
end

function actions.grep_string()
  require("telescope.builtin").grep_string({
    search = vim.fn.input("Grep > "),
  })
end

function actions.config()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config"),
    prompt_title = "Neovim Config",
    hidden = true,
  })
end

function actions.todos()
  vim.cmd("TodoTelescope")
end

function actions.quit()
  vim.cmd.qa()
end

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

    -- My custom silly header.
    config.layout[2].val = {
      "   /:` ;: `:\\       :::. :::::::::::::::.    :::::::..   :::",
      "   /;` ;; `;\\       ;;`;;;;;;;;;;'''';;`;;   ;;;;``;;;;  ;;;",
      "   n[' [[ '[n      ,[[ '[[,   [[    ,[[ '[[,  [[[,/[[['  [[[",
      '  c$"  $$  "$c    c$$$cc$$$c  $$   c$$$cc$$$c $$$$$$c    $$$',
      ' o8"   88   "8o    888   888, 88,   888   888,888b "88bo,888',
      'mM"    MM    "Mm   YMM   ""`  MMM   YMM   ""` MMMM   "W" MMM',
    }

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
          dashboard.button("f", "󰈞  Find file", actions.find_files),
          dashboard.button("g", "󰊄  Live grep", actions.live_grep),
          dashboard.button("s", "󰱽  Grep string", actions.grep_string),
          dashboard.button("t", "  TODOs", actions.todos),
          dashboard.button("c", "  Config", actions.config),
          dashboard.button("q", "󰅚  Quit", actions.quit),
        }
      end
    end

    alpha.setup(config)
  end,
}
