local utils = require('utils')
local config = require('plugins.language-support.common')
local invariant_require = utils.invariant_require

local coq = require('plugins.core.coq-nvim')
local lspconfig = invariant_require('lspconfig')

if lspconfig then
  lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
    on_attach = config.on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    }
  }))
end
