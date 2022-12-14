local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  t = {
    name = 'File tree actions',
    t = {
      '<Cmd>NvimTreeToggle<CR>',
      'Toggle tree open',
    },
    R = {
      '<Cmd>NvimTreeRefresh<CR>',
      'Refresh tree content',
    },
  },
})
