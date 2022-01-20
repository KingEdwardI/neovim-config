local utils = require('utils')

local buf_map = utils.buf_map
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

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
  vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
  vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
  vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
  vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
  vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')

  buf_map(bufnr, 'n', '<Leader>gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', '<Leader>rn', ':LspRename<CR>')
  buf_map(bufnr, 'n', '<Leader>gy', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', '<Leader>h', ':LspSignatureHelp<CR>')
  buf_map(bufnr, 'n', '<Leader>H', ':LspHover<CR>')
  buf_map(bufnr, 'n', '<Leader>n', ':LspDiagNext<CR>')
  buf_map(bufnr, 'n', '<Leader>N', ':LspDiagPrev<CR>')
  buf_map(bufnr, 'n', '<Leader><Leader>', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
  buf_map(bufnr, 'n', '<Leader>lf', ':LspFormatting<CR>')

  -- I'm not sure how this conditional is supposed to work, the tsserver
  -- config turns off document_formatting, so this never runs.
  -- keeping this around temporarily in case things get messed up by removing it.
  if client.resolved_capabilities.document_formatting then
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
end

config.on_attach = on_attach

return config
