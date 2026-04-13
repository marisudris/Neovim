local function set_indent(size)
  vim.opt_local.tabstop = size
  vim.opt_local.softtabstop = size
  vim.opt_local.shiftwidth = size
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "lua", "css", "html" },
  callback = function()
    set_indent(2)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "php", "c" },
  callback = function()
    set_indent(4)
  end,
})
