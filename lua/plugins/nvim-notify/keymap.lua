local wk = require('which-key')

local wk_mappings = {
  prefix = '<Leader>',
  h = {
    h = {
      'Show history',
      '<Cmd>Notifications<CR>',
    },
  },
}

wk.register(wk_mappings)
