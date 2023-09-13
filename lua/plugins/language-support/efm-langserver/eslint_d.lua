local utils = require('utils')
local invariant_require = utils.invariant_require

local eslint_d_lint = invariant_require('efmls-configs.linters.eslint_d')
local eslint_d_formatter = invariant_require('efmls-configs.formatters.eslint_d')
local fs = invariant_require('efmls-configs.fs')

-- original args:
-- local args = "--fix-to-stdout --stdin-filename '${INPUT}' --stdin"

local bin = fs.executable('eslint_d', fs.Scope.NODE)
local command = string.format('%s %s', bin,  '--stdin')

eslint_d_lint.lintCommand = command
eslint_d_formatter.formatCommand = command

return {
  eslint_d_lint,
  eslint_d_formatter
}
