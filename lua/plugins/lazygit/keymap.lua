local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<leader>gg', ':LazyGit<cr>', {})
set_keymap('n', '<leader>gs', ':LazyGitConfig<cr>', {})
