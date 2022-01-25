local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>Gd', '<Cmd>DiffviewOpen<CR>', {})
set_keymap('n', '<Leader>GD', '<Cmd>DiffviewClose<CR>', {})
