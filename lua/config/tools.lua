local tools = {}

tools.lsp = {
  html = {},
  cssls = {},
  ts_ls = {},
  intelephense = {
    settings = {
      intelephense = {
        files = { maxSize = 5000000 },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
      },
    },
  },
}

tools.formatters = {
  "php-cs-fixer",
  "biome",
}

tools.linters = {
  "phpcs",
}

return tools
