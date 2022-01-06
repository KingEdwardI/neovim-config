local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', ',shc', ':ShellCheck!<cr>', {})
