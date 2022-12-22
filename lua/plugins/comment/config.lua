local utils = require('utils')
local invariant_require = utils.invariant_require
local comment = invariant_require('Comment')
local ts_context_commentstring =
  invariant_require('ts_context_commentstring.integrations.comment_nvim')

if comment and ts_context_commentstring then
  comment.setup({
    -- Add a space b/w comment and the line
    padding = true,

    -- Whether the cursor should stay at its position
    -- NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    sticky = false,

    -- Lines to be ignored while comment/uncomment.
    -- Could be a regex string or a function that returns a regex string.
    -- Example: Use '^$' to ignore empty lines
    ignore = '^$',

    -- LHS of toggle mappings in NORMAL + VISUAL mode
    toggler = {
      -- Line-comment toggle keymap
      line = ',cc',
      -- Block-comment toggle keymap
      block = ',cb',
    },

    -- LHS of operator-pending mappings in NORMAL + VISUAL mode
    opleader = {
      -- Line-comment keymap
      line = ',c',
      -- Block-comment keymap
      block = ',cb',
    },

    -- LHS of extra mappings
    -- @type table
    extra = {
      -- Add comment on the line above
      above = ',ct',
      -- Add comment on the line below
      below = ',cn',
      -- Add comment at the end of line
      eol = ',c-',
    },

    -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    mappings = {
      -- Operator-pending mapping
      -- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
      -- NOTE: These mappings can be changed individually by `opleader` and `toggler` config
      basic = true,
      -- Extra mapping
      -- Includes `gco`, `gcO`, `gcA`
      extra = true,
      -- Extended mapping
      -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extended = false,
    },
    -- Pre-hook, called before commenting the line
    pre_hook = ts_context_commentstring.create_pre_hook(),

    -- Post-hook, called after commenting is done
    post_hook = nil,
  })
end
