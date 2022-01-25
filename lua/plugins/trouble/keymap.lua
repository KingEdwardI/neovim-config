local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>xx', '<Cmd>TroubleToggle<CR>', { silent = true, noremap = true })
set_keymap('n', '<Leader>xw', '<Cmd>Trouble workspace_diagnostics<CR>', { silent = true, noremap = true })
set_keymap('n', '<Leader>xd', '<Cmd>Trouble lsp_document_diagnostics<CR>', { silent = true, noremap = true })
set_keymap('n', '<Leader>xl', '<Cmd>Trouble loclist<CR>', { silent = true, noremap = true })
set_keymap('n', '<Leader>xf', '<Cmd>Trouble quickfix<CR>', { silent = true, noremap = true })
