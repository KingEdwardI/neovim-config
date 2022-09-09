local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>gg', '<Cmd>LazyGit<CR>')
set_keymap('n', '<Leader>gs', '<Cmd>LazyGitConfig<CR>')
