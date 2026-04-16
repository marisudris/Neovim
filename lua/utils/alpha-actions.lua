local M = {}

function M.find_files()
  require("telescope.builtin").find_files()
end

function M.live_grep()
  require("telescope.builtin").live_grep()
end

function M.grep_string()
  require("telescope.builtin").grep_string({
    search = vim.fn.input("Grep > "),
  })
end

function M.config()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config"),
    prompt_title = "Neovim Config",
    hidden = true,
  })
end

function M.todos()
  vim.cmd("TodoTelescope")
end

function M.quit()
  vim.cmd.qa()
end

return M
