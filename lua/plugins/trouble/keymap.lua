local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
set_keymap('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', { silent = true, noremap = true })
set_keymap('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>', { silent = true, noremap = true })
set_keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', { silent = true, noremap = true })
set_keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', { silent = true, noremap = true })
set_keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', { silent = true, noremap = true })
set_keymap(
  'n',
  '<leader>xn',
  "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",
  { silent = true, noremap = true }
)
set_keymap(
  'n',
  '<leader>xN',
  "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
  { silent = true, noremap = true }
)
