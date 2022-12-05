local utils = require('utils')
local invariant_require = utils.invariant_require

local saga = invariant_require('lspsaga')

if saga then
  saga.init_lsp_saga({
    finder_action_keys = {
      open = 'o',
      vsplit = 's',
      split = 'i',
      quit = { 'q', '<ESC>' },
      scroll_down = '<C-f>',
      scroll_up = '<C-b>',
    },
    code_action_keys = {
      -- quit = { 'q', '<ESC>' },
      quit = 'q',
    },
    definition_action_keys = {
      quit = 'q',
    },
    max_preview_lines = 50,
    rename_action_quit = { 'q', '<ESC>' },
    code_action_lightbulb = {
      cache_code_action = false,
    },
    border_style = 'rounded',
    finder_request_timeout = 7500,
  })
end
