-- local path = require('pl.path')
local utils = {}

utils.isnil = function(str)
  return str == nil or str == ''
end

utils.get_node_version = function()
  local handle = io.popen('node -v')
  local result
  if handle then
    result = handle:read('*a')
    handle:close()
  end
  return result:sub(1, -2) -- Remove the trailing newline
end

-- Todo get this working, and working with penlight
utils.is_neovim_npm_installed = function(version)
  -- local neovim_npm_path = os.getenv('HOME')
  --   .. '/.nvm/versions/node/'
  --   .. version
  --   .. '/lib/node_modules/neovim'

  return true
  -- return path.isdir(neovim_npm_path)
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

  local prompt_text = [[
Error occurred when loading a plugin: Unable to load "]] .. pluginName .. [[" 
in file "]] .. debug.getinfo(2, 'S').source
  --           .. [["
  -- Would you like to run PackerInstall Y/n?
  -- ]],

  if not present then
    if pluginName ~= 'packer' then
      vim.notify(prompt_text, vim.log.levels.ERROR)

      -- vim.ui.input(
      --   {
      --     prompt = prompt_text,
      --   }
      --   function(input)
      --   if utils.isnil(input) or string.lower(input) == 'y' then
      --     vim.cmd(':PackerInstall<CR>')
      --   end
      -- end
      -- )
    end
    return false
  end

  return plugin
end

return utils
