local lsp_keymap = require('lsp.keymap')
local config = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.

  lsp_keymap.setup(bufnr)

  -- I'm not sure how this conditional is supposed to work, the tsserver
  -- config turns off document_formatting, so this never runs.
  -- keeping this around temporarily in case things get messed up by removing it.
  if client.server_capabilities.document_formatting then
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
end

config.on_attach = on_attach

-- prevent lsp from updating while in insert mode
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { update_in_insert = false }
)

return config
