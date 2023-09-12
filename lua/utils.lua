local utils = {}

utils.remove_newline = function(str)
  return string.gsub(str, '[\n\r]', '')
end

utils.get_node_version = function()
  local check_node_version = io.popen('node --version')
  local node_version
  if check_node_version then
    node_version = utils.remove_newline(check_node_version:read('*a'))
    check_node_version:close()
  end

  return node_version
end

utils.check_neovim_exists = function(version)
  local does_exist = io.popen(
    '[ -d $HOME/.nvm/versions/node/'
      .. version
      .. '/lib/node_modules/neovim ]  && echo true || echo false'
  )
  local neovim_exists
  if does_exist then
    neovim_exists = utils.remove_newline(does_exist:read('*a'))
    does_exist:close()
  end

  return neovim_exists
end

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
  This method is used to safely require a plugin in Lua.

  Parameters:
  - `pluginName`: A string representing the name of the plugin to be required.

  Output:
  - Returns the required plugin if it is present and successfully required.
  - If the plugin is not present or encounters an error while requiring it,
      it displays an error message in Vim, indicating the failure to load the
      plugin. It returns `false` in such cases.
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
