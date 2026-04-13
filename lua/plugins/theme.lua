return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",
      extend_background_colors = true,
      styles = {
        italic = true,
        transparency = true,
      },
    })

    vim.cmd("colorscheme rose-pine")

    local p = require("rose-pine.palette")
    local groups = {
      -- Border colors
      BlinkCmpMenuBorder          = { fg = p.pine, bg = "NONE" },
      BlinkCmpSignatureHelpBorder = { fg = p.pine, bg = "NONE" },
      BlinkCmpDocBorder           = { fg = p.pine, bg = "NONE" },
      FloatBorder                 = { fg = p.pine, bg = "NONE" },
      DiagnosticFloatingBorder    = { fg = p.pine, bg = "NONE" },

      -- Background colros
      BlinkCmpMenu          = { bg = "NONE" },
      BlinkCmpMenuSelection = { fg = p.text, bg = p.overlay, bold = true },
      BlinkCmpSignatureHelp = { bg = "NONE" },
      BlinkCmpDoc           = { bg = "NONE" },
      NormalFloat           = { bg = "NONE" },
    }

    for group, settings in pairs(groups) do
      vim.api.nvim_set_hl(0, group, settings)
    end
  end,
}
