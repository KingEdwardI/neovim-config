local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  l = {
    name = 'Lint',
    s = {
      '<Cmd>ShellCheck!<CR>',
      'Run shellcheck',
    },
  },
})
