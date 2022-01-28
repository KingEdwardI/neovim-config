local utils = require('utils')
local invariant_require = utils.invariant_require
local npairs = invariant_require('nvim-autopairs')
local Rule = invariant_require('nvim-autopairs.Rule')

if npairs then
  npairs.setup({})

  npairs.add_rule(Rule('<!--', '-->', { 'html', 'markdown' }))
end
