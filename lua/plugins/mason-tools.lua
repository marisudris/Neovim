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

    -- Formatters + linters
    for _, ft_formatters in pairs(tools.formatters) do
      for _, formatter in ipairs(ft_formatters) do
        if not vim.tbl_contains(ensure_installed, formatter) then
          -- conform.nvim uses underscores, mason often uses hyphens.
          local mason_name = formatter:gsub("_", "-")
          table.insert(ensure_installed, mason_name)
        end
      end
    end
    vim.list_extend(ensure_installed, tools.linters)

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      run_on_start = true,
    })
  end,
}
