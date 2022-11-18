local utils = require('utils')
local invariant_require = utils.invariant_require
local which_key = invariant_require('which-key')

if which_key then
  which_key.setup({
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
    popup_mappings = {
      scroll_down = '<Down>',
      scroll_up = '<Up>',
    },
  })
end
