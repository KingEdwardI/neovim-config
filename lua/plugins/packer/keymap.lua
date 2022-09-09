local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>pu', '<Cmd>PackerUpdate<CR>')
set_keymap('n', '<Leader>pc', '<Cmd>PackerCompile<CR> <Cmd>echo "finished compiling"<CR>')
set_keymap('n', '<Leader>pi', '<Cmd>PackerInstall<CR> <Cmd>echo "finished installing"<CR>')
set_keymap('n', '<Leader>pC', '<Cmd>PackerClean<CR> <Cmd>echo "finished cleaning"<CR>')
set_keymap('n', '<Leader>ps', '<Cmd>PackerSync<CR>')
