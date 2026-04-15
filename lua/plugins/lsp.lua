local tools = require("config.tools")
local servers = tools.lsp

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
          map("n", "<leader>vd", function()
            -- Get all diagnostics for the current line
            local line = vim.api.nvim_win_get_cursor(0)[1] - 1
            local diagnostics = vim.diagnostic.get(0, { lnum = line })

            -- Default to Rose Pine if no diagnostics found
            local hl_group = "FloatBorder"

            if #diagnostics > 0 then
              -- Find the highest severity (1 is Error, 4 is Hint)
              local max_severity = 4
              for _, d in ipairs(diagnostics) do
                if d.severity < max_severity then
                  max_severity = d.severity
                end
              end

              -- Map severity to our new highlight groups
              local severity_map = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticBorderError",
                [vim.diagnostic.severity.WARN]  = "DiagnosticBorderWarn",
                [vim.diagnostic.severity.INFO]  = "DiagnosticBorderInfo",
                [vim.diagnostic.severity.HINT]  = "DiagnosticBorderHint",
              }
              hl_group = severity_map[max_severity]
            end

            -- Create 8-part border table using the chosen highlight
            local border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
            local dynamic_border = {}
            for _, char in ipairs(border_chars) do
              table.insert(dynamic_border, { char, hl_group })
            end

            vim.diagnostic.open_float({ border = dynamic_border })
          end, opts)
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
