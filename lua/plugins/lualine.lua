return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      overlay = "#393552",
      surface = "#2a273f",
      love = "#b4637a",
      gold = "#ea9d34",
      rose = "#d7827e",
      pine = "#286983",
      pine_moon = "#3e8fb0",
      foam = "#56949f",
      iris = "#907aa9",
      highlight = "#cecacd",
      base = "#232136",
    }

    local starship_theme = {
      normal = {
        a = { bg = colors.overlay, fg = colors.highlight, gui = "bold" },
        b = { bg = colors.pine, fg = colors.base, gui = "bold" },
        c = { bg = colors.surface, fg = colors.highlight },
      },
      insert = {
        a = { bg = colors.love, fg = colors.base, gui = "bold" },
        b = { bg = colors.pine, fg = colors.base, gui = "bold" },
        c = { bg = colors.surface, fg = colors.highlight },
      },
      visual = {
        a = { bg = colors.iris, fg = colors.base, gui = "bold" },
        b = { bg = colors.pine, fg = colors.base, gui = "bold" },
        c = { bg = colors.surface, fg = colors.highlight },
      },
      command = {
        a = { bg = colors.gold, fg = colors.base, gui = "bold" },
        b = { bg = colors.pine, fg = colors.base, gui = "bold" },
        c = { bg = colors.surface, fg = colors.highlight },
      },
      replace = {
        a = { bg = colors.rose, fg = colors.base, gui = "bold" },
        b = { bg = colors.pine, fg = colors.base, gui = "bold" },
        c = { bg = colors.surface, fg = colors.highlight },
      },
      inactive = {
        a = { bg = colors.base, fg = colors.overlay, gui = "bold" },
        b = { bg = colors.base, fg = colors.overlay },
        c = { bg = colors.base, fg = colors.overlay },
      },
    }

    require("lualine").setup({
      options = {
        theme = starship_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return "󰣚 " .. str
            end,
          },
        },
        lualine_b = {
          { "filename", path = 1 },
        },
        lualine_c = {
          { "branch", icon = "" },
          "diff",
          "diagnostics",
        },
        lualine_x = {
          { "filetype", icon_only = false },
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          { "datetime", style = "%H:%M", color = { bg = colors.pine_moon, fg = colors.base, gui = "bold" } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
