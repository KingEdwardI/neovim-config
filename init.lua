local utils = require('utils')
local invariant_require = utils.invariant_require

invariant_require('impatient')

-- vim.api.nvim_set_var("LUA_PATH", "/usr/local/Cellar/luarocks/3.9.2/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/edward.vetterdrake/.luarocks/share/lua/5.4/?.lua;/Users/edward.vetterdrake/.luarocks/share/lua/5.4/?/init.lua")
-- vim.api.nvim_set_var("LUA_CPATH", "/usr/local/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;./?.so;/Users/edward.vetterdrake/.luarocks/lib/lua/5.4/?.so")

require('plugins')
require('core_keymap')
require('plugins.keymaps')
require('core_settings')
