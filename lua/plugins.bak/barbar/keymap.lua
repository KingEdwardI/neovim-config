local wk = require('which-key')
local opts = { noremap = true, silent = true }

local no_prefix_mappings = {
  g = {
    name = 'Goto',
    t = {
      '<Cmd>BufferNext<CR>',
      'Move to next buffer',
      opts = opts,
    },
    T = {
      '<Cmd>BufferPrevious<CR>',
      'Move to previous buffer',
      opts = opts,
    },
    m = {
      '<Cmd>BufferMoveNext<CR>',
      'Move buffer to the right',
      opts = opts,
    },
    M = {
      '<Cmd>BufferMovePrevious<CR>',
      'Move buffer to the left',
      opts = opts,
    },
    c = {
      '<Cmd>BufferClose<CR>',
      'Close current buffer',
      opts = opts,
    },
  },
}

local wk_mappings = {
  prefix = '<Leader>',
  b = {
    name = 'Buffer actions',
    s = {
      name = 'Buffer sorting',
      n = {
        '<Cmd>BufferOrderByBufferNumber<CR>',
        'Sort by buffer number',
        opts = opts,
      },
      d = {
        '<Cmd>BufferOrderByBufferDirectory<CR>',
        'Sort by directory',
        opts = opts,
      },
      l = {
        '<Cmd>BufferOrderByLanguage<CR>',
        'Sort alphabetically',
        opts = opts,
      },
    },
    p = {
      '<Cmd>BufferPick<CR>',
      'Magic buffer picking mode',
      opts = opts,
    },
  },
}

for index = 0, 9, 1 do
  local i = tostring(index)
  wk_mappings.b[i] = {
    '<Cmd>BufferGoto ' .. i .. '<CR>',
    'Go to buffer no ' .. i,
  }
end

wk.register(wk_mappings)
wk.register(no_prefix_mappings)

-- Todo: need to figure out good mappings for these
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
