local utils = require('utils')
local invariant_require = utils.invariant_require
local mason = invariant_require('mason')
local mason_lspconfig = invariant_require('mason-lspconfig')

if mason and mason_lspconfig then
  mason.setup()
  mason_lspconfig.setup()
end
