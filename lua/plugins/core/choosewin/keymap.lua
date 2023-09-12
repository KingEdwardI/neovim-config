local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  g = {
    w = {
      '<Plug>(choosewin)',
      'Choose window',
    },
  },
})
