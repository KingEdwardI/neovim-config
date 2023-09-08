local utils = require('utils')
local config = require('lsp.config')

local invariant_require = utils.invariant_require

local coq = require('plugins.coq-nvim.config')
local lspconfig = invariant_require('lspconfig')

if lspconfig then
  lspconfig.denols.setup({
    server = coq.lsp_ensure_capabilities({
      on_attach = function(client, bufnr)
        config.on_attach(client, bufnr)
      end,
      root_dir = function(filename)
        return lspconfig.util.root_pattern('deno.json', '.git')(filename)
            or vim.fn.getcwd()
      end,
    }),
  })
end
