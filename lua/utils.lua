local utils = {}

utils.set_keymap = vim.api.nvim_set_keymap

utils.buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

return utils
