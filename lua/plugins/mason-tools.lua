return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    local tools = require("config.tools")

    local ensure_installed = {}

    -- LSP servers
    vim.list_extend(ensure_installed, vim.tbl_keys(tools.lsp))

    -- formatters + linters
    vim.list_extend(ensure_installed, tools.formatters)
    vim.list_extend(ensure_installed, tools.linters)

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      run_on_start = true,
    })
  end,
}
