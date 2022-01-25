local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>pu', '<Cmd>PackerUpdate<CR>', {})
set_keymap('n', '<Leader>pc', '<Cmd>PackerCompile<CR>', {})
set_keymap('n', '<Leader>pi', '<Cmd>PackerInstall<CR>', {})
set_keymap('n', '<Leader>pC', '<Cmd>PackerClean<CR>', {})
set_keymap('n', '<Leader>ps', '<Cmd>PackerSync<CR>', {})
