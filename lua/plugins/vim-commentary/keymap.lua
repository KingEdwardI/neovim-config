local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', ',cc', '<Plug>CommentaryLine<CR>', {})
set_keymap('x', ',cc', '<Plug>Commentary', {})
set_keymap('o', ',cc', '<Plug>Commentary', {})
