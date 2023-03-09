local utils = require('utils')
local config = require('lsp.config')
local invariant_require = utils.invariant_require

local coq = require('plugins.coq-nvim.config')
local lsp = invariant_require('lspconfig')

if lsp then
  local HOME = vim.fn.expand('$HOME')

  local sumneko_root_path = HOME .. '/tools/lua-language-server'
  local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'

  lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities({
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    on_attach = config.on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  }))
end
