return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = require("config.tools").formatters,
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},

		-- Customize specific formatters
		formatters = {
			php_cs_fixer = {
				command = "php-cs-fixer",
			},
		},
	},
}
