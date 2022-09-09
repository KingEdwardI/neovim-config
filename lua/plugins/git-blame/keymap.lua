local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>gb', '<Cmd>GitBlameToggle<CR>')
