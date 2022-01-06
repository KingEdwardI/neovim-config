local utils = require('utils')
local nvim_lsp = require('lspconfig')

local buf_map = utils.buf_map
local config = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
  vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
  vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
  vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
  vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
  vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
  -- vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  buf_map(bufnr, 'n', '<Leader>gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', '<Leader>rn', ':LspRename<CR>')
  buf_map(bufnr, 'n', '<Leader>gy', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', '<Leader>fr', ':LspRefs<CR>')
  buf_map(bufnr, 'n', '<Leader>h', ':LspHover<CR>')
  buf_map(bufnr, 'n', '<Leader>n', ':LspDiagNext<CR>')
  buf_map(bufnr, 'n', '<Leader>N', ':LspDiagPrev<CR>')
  buf_map(bufnr, 'n', '<Leader>ca', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
  buf_map(bufnr, 'n', '<Leader>lf', ':LspFormatting<CR>')
  -- buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

  if client.resolved_capabilities.document_formatting then
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>', opts)
end

config.on_attach = on_attach

return config
