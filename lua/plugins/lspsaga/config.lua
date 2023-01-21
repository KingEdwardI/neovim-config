local utils = require('utils')
local invariant_require = utils.invariant_require

local saga = invariant_require('lspsaga')

if saga then
  saga.setup({
    code_action = {
      keys = {
        quit = { 'q', '<ESC>' },
      },
    },
    -- diagnostic = {},
    finder = {
      edit = { 'o', '<CR>' },
      vsplit = 's',
      split = 'i',
      quit = { 'q', '<ESC>' },
      tabe = 't',
      scroll_down = '<C-f>',
      scroll_up = '<C-b>',
    },
    lightbulb = {
      enable = false,
    },
    preview = {
      lines_above = 10,
      lines_below = 40,
    },
    rename = {
      quit = { 'q', '<ESC>' },
    },
    scroll_preview = {
      scroll_down = '<C-d>',
      scroll_up = '<C-u>',
    },
    ui = {
      border = 'rounded',
      colors = {
        normal_bg = '#17101a',
        red = '#820404',
        magenta = '#8f0d52',
        orange = '#6b3403',
        yellow = '#78550b',
        green = '#344d0e',
        cyan = '#045a63',
        blue = '#06365e',
        purple = '#31026b',
        -- white = '#d1d4cf',
        -- black = '#1c1c19',
      },
    },
    -- request_timeout = 7500,
  })
end
