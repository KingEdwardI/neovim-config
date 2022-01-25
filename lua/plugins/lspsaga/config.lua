local saga = require('lspsaga')

saga.setup({
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = { 'q', '<ESC>' },
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
})
