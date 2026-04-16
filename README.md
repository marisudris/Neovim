# Neovim with Lazy plugins

My Lazy setup with blink code completion and integrated LSPs.
Rose Pine theme everywhere.

## Plugins Used

### Code completion and language server intergration

- [Blink](https://github.com/saghen/blink.cmp) - a completion plugin with support for LSPs, cmdline, signature help, and snippets. It uses an optional custom fuzzy matcher for typo resistance. Customized window appearance.
- [Luasnip](https://github.com/L3MON4D3/LuaSnip) - snippet engine.
- [Mason](https://github.com/mason-org/mason.nvim) - package manager for LSPs.
    - [Mason tool installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim).
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - collection of LSP server configurations for native Neovim LSP client.


### Parsing and formatting
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provides functions for installing, updating, and removing tree-sitter parsers.
- [Mini pairs](https://github.com/nvim-mini/mini.pairs) - minimal and fast autopairs.
- [Conform](https://github.com/stevearc/conform.nvim) - lightweight formatter plugin for Neovim.

### Quality of Life Plugins
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - a highly extendable fuzzy finder over lists. Custom keymaps by me.
- [TODO comments](https://github.com/folke/todo-comments.nvim) - lugin for to highlighting and searching todo comments like TODO, HACK, BUG in your code base - quite a bit theme-customized by me.


### Editor & Appearance
- [Rose Pine Theme](https://github.com/rose-pine/neovim) - all natural pine, faux fur and a bit of soho vibes for the classy minimalist. Customized by adding specific highlight groups for windos/menus.
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - plugin for browsing the file system and other tree like structures in whatever style suits you, including sidebars, floating windows, netrw split style, or all of them at once. Custom keymaps by me.
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) - a fast and easy to configure Neovim statusline written in Lua. Custom setup & colors - resembling my starship theme. TODO: extract color values in a global config.
- [Alpha](https://github.com/goolord/alpha-nvim) - a fast and fully programmable splash screen & greeter for Neovim. Custom button menu config - mostly intergrating Telescope.
 [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) - deep buffer integration for Git.






