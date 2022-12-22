local utils = require('utils')
local config = require('lsp.config')
local invariant_require = utils.invariant_require

local coq = require('plugins.coq_nvim.config')
local lsp = invariant_require('lspconfig')

if lsp then
  lsp.pyright.setup(coq.lsp_ensure_capabilities({
    on_attach = config.on_attach,
  }))
end
