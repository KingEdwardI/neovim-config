local wk = require('which-key')

local wk_mappings = {
  prefix = '<Leader>',
  h = {
    h = {
      '<Cmd>Telescope notify<CR>',
      'Show history',
    },
  },
}

wk.register(wk_mappings)
