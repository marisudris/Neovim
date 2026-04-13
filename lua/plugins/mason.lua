return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {
    -- Only formatters/Linters here
    ensure_installed = {
      "phpcs",
      "php-cs-fixer",
      "biome",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")

    -- Auto-install formatters/linters
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}
