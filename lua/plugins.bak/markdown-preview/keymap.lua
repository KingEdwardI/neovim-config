local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  m = {
    name = 'Markdown actions',
    d = {
      '<Cmd>MarkdownPreviewToggle<CR>',
      'Open markdown previewer',
    },
  },
})
