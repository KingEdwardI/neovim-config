local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  G = {
    name = 'Git actions',
    b = {
      '<Cmd>GitBlameToggle<CR>',
      'Toggle git blame',
    },
  },
})
