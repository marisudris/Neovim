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
        local p = require("rose-pine.palette")
        local groups = {
            BlinkCmpMenu = { bg = "NONE" },
            BlinkCmpMenuBorder = { fg = p.pine, bg = "NONE" },
            BlinkCmpSignatureHelp = { bg = "NONE" },
            BlinkCmpSignatureHelpBorder = { fg = p.muted, bg = "NONE" },

            DiagnosticFloatingBorder = { fg = p.pine, bg = "NONE" },
            FloatBorder = { fg = p.pine, bg = "NONE" },
            NormalFloat = { bg = "NONE" },
        }

        for group, settings in pairs(groups) do
            vim.api.nvim_set_hl(0, group, settings)
        end

        vim.cmd("colorscheme rose-pine")
    end,
}
