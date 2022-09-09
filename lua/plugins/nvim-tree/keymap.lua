local utils = require('utils')
local set_keymap = utils.set_keymap

-- NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them
set_keymap('n', '<Leader>tt', '<Cmd>NvimTreeToggle<CR>')
set_keymap('n', '<Leader>tR', '<Cmd>NvimTreeRefresh<CR>')
