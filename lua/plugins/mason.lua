return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {
    -- Listing only formatters/Linters here (language servers in lsp.lua)
    ensure_installed = {
      "phpcs",
      "php-cs-fixer",
      "biome",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")

    -- Ensure registry is ready before using it and auto-install everything
    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local ok, pkg = pcall(mr.get_package, tool)
        if ok and not pkg:is_installed() then
          pkg:install()
        end
      end
    end)
  end,
}
