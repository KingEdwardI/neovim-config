local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<leader>Gd', ':DiffviewOpen<cr>', {})
set_keymap('n', '<leader>GD', ':DiffviewClose<cr>', {})
