return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip").config.setup({
      store_selection_keys = "<Tab>",
      history = true,
      update_events = "TextChanged,TextChangedI",
    })
  end,
}
