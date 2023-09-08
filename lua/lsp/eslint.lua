local utils = require('utils')
local invariant_require = utils.invariant_require

local eslint = invariant_require('eslint')

if eslint then
  eslint.setup({
    bin = 'eslint_d',
    code_actions = {
      enable = true,
      apply_on_save = {
        enable = true,
        types = { 'directive', 'problem', 'suggestion', 'layout' },
      },
    },
    diagnostics = {
      enable = true,
      report_unused_disable_directives = false,
      run_on = 'save', -- or `save`
    },
  })
end
