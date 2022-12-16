local utils = require('utils')
local config = require('lsp.config')
local invariant_require = utils.invariant_require

local rt = invariant_require('rust-tools')
local lsp = invariant_require('lspconfig')

if lsp then
  rt.setup({
    server = {
      on_attach = function(client, bufnr)
        config.on_attach(client, bufnr)
      end,
    },
  })
end
