local utils = require('utils')
local set_keymap = utils.set_keymap

-- Need to override the default mapping manually so that commenting works right and doesn't accidentally
-- trigger `c` after commenting.
set_keymap('v', ',cc', '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$')
