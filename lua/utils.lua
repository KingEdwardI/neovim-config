local utils = {}

utils.set_keymap = function(mode, mapping, command, opts)
  opts = opts or {}
  vim.api.nvim_set_keymap(mode, mapping, command, opts)
end

utils.buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

--[[
-- @param pluginName string
--
-- @returns boolean | table
--]]
utils.invariant_require = function(pluginName)
  local present, plugin = pcall(require, pluginName)

  if not present then
    if pluginName ~= 'packer' then
      vim.cmd([[
        echohl ErrorMsg
        echo "Error occurred while loading a plugin"
        echohl None
        echo "Unable to load plugin: \"]] .. pluginName .. [[\"."
        echo "Are you sure it is installed? Check :PackerStatus and run :PackerInstall if needed."
      ]])
    end
    return false
  end

  return plugin
end

utils.merge_table = function(table1, table2)
  for _, v in ipairs(table2) do
    table.insert(table1, v)
  end

  return table1
end

return utils
