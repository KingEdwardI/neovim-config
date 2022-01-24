local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', ',pu', ':PackerUpdate<CR>', {})
set_keymap('n', ',pc', ':PackerCompile<CR>', {})
set_keymap('n', ',pi', ':PackerInstall<CR>', {})
set_keymap('n', ',pC', ':PackerClean<CR>', {})
set_keymap('n', ',ps', ':PackerSync<CR>', {})
