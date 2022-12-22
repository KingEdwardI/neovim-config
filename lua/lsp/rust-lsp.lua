local utils = require('utils')
local config = require('lsp.config')
local invariant_require = utils.invariant_require

local coq = require('plugins.coq_nvim.config')
local rt = invariant_require('rust-tools')

if rt then
  rt.setup(coq.lsp_ensure_capabilities({
    server = {
      on_attach = function(client, bufnr)
        config.on_attach(client, bufnr)
      end,
    },
  }))
end
