return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTelescope", "TodoQuickFix", "TodoLocList" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local p = require("rose-pine.palette")

    return {
      signs = true,

      -- Mapping Folke's color names to Rose Pine palette
      colors = {
        error = { p.love }, -- Red/Pink
        warning = { p.gold }, -- Yellow/Gold
        info = { p.pine }, -- Teal/Pine
        hint = { p.foam }, -- Cyan/Foam
        default = { p.iris }, -- Purple
        test = { p.rose }, -- Rose/Pink
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      highlight = {
        keyword = "wide",
        after = "fg",
        comments_only = true,
      },
    }
  end,
}
