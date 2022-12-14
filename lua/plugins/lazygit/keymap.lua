local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  G = {
    name = 'Git actions',
    g = {
      '<Cmd>LazyGit<CR>',
      'Open lazygit',
    },
    s = {
      '<Cmd>LazyGitConfig<CR>',
      'Open lazygit settings',
    },
  },
})
