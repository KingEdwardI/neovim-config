local utils = require('utils')
local config = require('lsp.config')

local invariant_require = utils.invariant_require

local completion = invariant_require('completion')
local coq = require('plugins.coq-nvim.config')
local lspconfig = invariant_require('lspconfig')

if lspconfig then
  lspconfig.denols.setup({
    server = coq.lsp_ensure_capabilities({
      on_attach = function(client, bufnr)
        completion.on_attach(client, bufnr)
        config.on_attach(client, bufnr)
      end
    })
  })
end
