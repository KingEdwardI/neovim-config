local utils = require('utils')
local invariant_require = utils.invariant_require

local saga = invariant_require('lspsaga')

if saga then
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
end
