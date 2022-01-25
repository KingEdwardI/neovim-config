local utils = {}

utils.set_keymap = vim.api.nvim_set_keymap

utils.buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

utils.invariant_require = function(pluginName)
  local present, plugin = pcall(require, pluginName)

  if not present then
    vim.cmd([[
    echohl ErrorMsg
    echo "Error occured while loading a plugin"
    echohl None
    echo "Unable to load plugin: \"]] .. pluginName .. [[\"."
    echo "Are you sure it is installed? Check :PackerStatus and run :PackerInstall if needed."
    ]])
    return false
  end

  return plugin
end

return utils
