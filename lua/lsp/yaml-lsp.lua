local config = require('lsp.config')
local utils = require('utils')

local invariant_require = utils.invariant_require

local lspconfig = invariant_require('lspconfig')

if lspconfig then
  lspconfig.yamlls.setup({})
end
