local utils = require('utils')
local invariant_require = utils.invariant_require

local barbar = invariant_require('barbar')

if barbar then
  barbar.setup({
    -- Enable/disable animations
    animation = true,
    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = false,
    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = true,
    -- Enable/disable close button
    closable = true,
    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,
    -- Excludes buffers from the tabline
    -- exclude_ft = [],
    -- exclude_name = [],

    -- Enable/disable icons
    icons = {
      button = '',
      filetype = { enabled = true },
      separator = { left = '▎' },
      pinned = { button = '車' },
      modified = { button = '●' },
      inactive = {
        separator = {
          left = '▎',
        },
      },
    },
    -- If set, the icon color will follow its corresponding buffer
    -- highlight group. By default, the Buffer*Icon group is linked to the
    -- Buffer* group (see Highlighting below). Otherwise, it will take its
    -- default value as defined by devicons.
    icon_custom_colors = false,
    -- If true, new buffers will be inserted at the end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = false,
    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,
    -- Sets the maximum buffer name length.
    maximum_length = 50,
    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,
    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustment
    -- for other layouts.
    -- letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    -- Adjusted assignment order for dvorak
    letters = 'aoeuidhtns;qjkxbmwvzpyfgcrlAOEUIDHTNSQJKXBMWVZPYFGCRL',
    -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
    -- where X is the buffer number. But only a static string is accepted here.
    no_name_title = nil,
  })
end

vim.cmd([[
highlight BufferCurrent guifg=#218a0c
highlight BufferVisible guifg=#cadec5
highlight BufferInactive guifg=#706f6f
]])
