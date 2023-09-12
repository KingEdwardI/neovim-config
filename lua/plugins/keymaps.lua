local wk = require('which-key')
local register_comment_keys = require('plugins.ui.comment.keymap')
require('plugins.ui.telescope.keymap')

register_comment_keys(wk)
