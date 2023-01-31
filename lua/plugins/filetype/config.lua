local utils = require('utils')
local invariant_require = utils.invariant_require

local filetype = invariant_require('filetype')

if filetype then
  filetype.setup({})
end
