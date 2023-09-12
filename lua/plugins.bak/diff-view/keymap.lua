local wk = require('which-key')

local wk_mappings = {
  prefix = '<Leader>',
  d = {
    name = 'Git diff viewer',
    v = {
      '<Cmd>DiffviewOpen<CR>',
      'Open diff view',
    },
    V = {
      '<Cmd>DiffviewClose<CR>',
      'Close diff view',
    },
  },
}

wk.register(wk_mappings)
