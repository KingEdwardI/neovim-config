local utils = require('utils')
local invariant_require = utils.invariant_require
local lsp_colors = invariant_require('lsp-colors')

if lsp_colors then
  lsp_colors.setup({
    Error = '#db4b4b',
    Warning = '#e0af68',
    Information = '#0db9d7',
    Hint = '#10B981',
  })
end
