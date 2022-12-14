local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  l = {
    name = 'Lint',
    j = {
      '<Cmd>FixJSON<CR>',
      'Lint json file',
    },
  },
})
