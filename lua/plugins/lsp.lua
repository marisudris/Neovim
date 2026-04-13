local servers = {
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

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "saghen/blink.cmp",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local _border = "rounded"

      -- Diagnostic Configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = "■",
          spacing = 2,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        float = {
          header = "",
          prefix = "",
          border = _border,
          focused = false,
        },
        hover = {
          border = _border,
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- LSP Keymaps (LspAttach)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local opts = { buffer = event.buf }
          local map = vim.keymap.set

          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "K", function ()
            vim.lsp.buf.hover { border = _border }
          end, opts)
          map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
          map("n", "<leader>vd", vim.diagnostic.open_float, opts)
          map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
          map("n", "<leader>vrr", vim.lsp.buf.references, opts)
          map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        end,
      })

      -- Setup global capabilities for all servers
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        window = {
          hover = { border = _border },
          signature_help = { border = _border },
        }
      })

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
