local utils = require('utils')
local invariant_require = utils.invariant_require

local pretty_fold = invariant_require('pretty-fold')

if pretty_fold then
  pretty_fold.setup({
    fill_char = '.',
    sections = {
      left = {
        '+',
        function()
          return string.rep('-', vim.v.foldlevel)
        end,
        ' ',
        'number_of_folded_lines',
        ':',
        'content',
      },
    },
  })
end
