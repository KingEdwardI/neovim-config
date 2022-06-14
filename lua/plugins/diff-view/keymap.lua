local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>dv', '<Cmd>DiffviewOpen<CR>', {})
set_keymap('n', '<Leader>dV', '<Cmd>DiffviewClose<CR>', {})
