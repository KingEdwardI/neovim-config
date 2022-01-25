local utils = require('utils')

local buf_map = utils.buf_map
local opts = { silent = true, noremap = true }

return function(bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
  vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
  vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
  vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')

  buf_map(bufnr, 'n', '<Leader>gd', '<Cmd>LspDef<CR>')
  buf_map(bufnr, 'n', '<Leader>rn', '<Cmd>LspRename<CR>')
  buf_map(bufnr, 'n', '<Leader>gy', '<Cmd>LspTypeDef<CR>')
  buf_map(bufnr, 'n', '<Leader>n', '<Cmd>LspDiagNext<CR>')
  buf_map(bufnr, 'n', '<Leader>N', '<Cmd>LspDiagPrev<CR>')
  buf_map(bufnr, 'n', '<Leader>a', '<Cmd>LspDiagLine<CR>')
  buf_map(bufnr, 'n', '<Leader>lf', '<Cmd>LspFormatting<CR>')

  buf_map(bufnr, 'n', '<Leader><Leader>', '<Cmd>Lspsaga code_action<CR>', opts)
  buf_map(bufnr, 'n', '<Leader>h', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  buf_map(bufnr, 'n', '<Leader>d', '<Cmd>Lspsaga hover_doc<CR>', opts)
  buf_map(bufnr, 'n', '<Leader>xn', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  buf_map(bufnr, 'n', '<Leader>n', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_map(bufnr, 'n', '<Leader>N', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_map(bufnr, 'n', '<Leader>w', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
  buf_map(bufnr, 'n', '<Leader>v', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
end
