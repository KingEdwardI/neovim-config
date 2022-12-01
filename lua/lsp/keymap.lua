local utils = require('utils')

local lsp_keymap = {}

local buf_map = utils.buf_map
local opts = { silent = true, noremap = true }

-- Todo: This works and I like it, but it would be better to turn this inside out
-- and pull in which-key, use which_key.register in each config file.
-- This will get rid of the need for my keymap.lua files, and the keymappings.lua,
-- reducing boilerplate and generally simplifying keymapping.
lsp_keymap.wk_mappings = {
  gy = {
    cmd = '<Cmd>LspTypeDef<CR>',
    mode = 'n',
  },
  lf = {
    cmd = '<Cmd>LspFormatting<CR>',
    mode = 'n',
  },
  lsr = {
    cmd = '<Cmd>LspRestart<CR>',
    mode = 'n',
  },
  rn = {
    cmd = '<Cmd>Lspsaga rename<CR>',
    mode = 'n',
  },
  n = {
    cmd = '<Cmd>Lspsaga diagnostic_jump_next<CR>',
    mode = 'n',
  },
  N = {
    cmd = '<Cmd>Lspsaga diagnostic_jump_prev<CR>',
    mode = 'n',
  },
  hf = {
    cmd = '<Cmd>Lspsaga lsp_finder<CR>',
    mode = 'n',
  },
  hd = {
    cmd = '<Cmd>Lspsaga hover_doc<CR>',
    mode = 'n',
  },
  hl = {
    cmd = '<Cmd>Lspsaga show_line_diagnostics<CR>',
    mode = 'n',
  },
  hc = {
    cmd = '<Cmd>Lspsaga show_cursor_diagnostics<CR>',
    mode = 'n',
  },
  hp = {
    cmd = '<Cmd>Lspsaga peek_definition<CR>',
    mode = 'n',
  },
}
-- special case
lsp_keymap.wk_mappings['<Leader>'] = {
  cmd = '<Cmd>Lspsaga code_action<CR>',
  mode = 'n',
}

lsp_keymap.setup = function(bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.cmd(
    'command! LspFormatting lua vim.lsp.buf.format({ timeout_ms = 2000 })'
  )
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')

  for key, value in pairs(lsp_keymap.wk_mappings) do
    buf_map(bufnr, value.mode, '<Leader>' .. key, value.cmd, opts)
  end

  buf_map(bufnr, 'n', '<C-c>t', '<Cmd>Lspsaga close_floaterm<CR>')
end

return lsp_keymap
