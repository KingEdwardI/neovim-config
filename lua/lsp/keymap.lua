-- Not using invariant_require here for custom error message
-- Todo: update invariant_require to allow overriding the message
local wk_ok, wk = pcall(require, 'which-key')

local make_mappings = function(bufnr)
  return {
    g = {
      name = 'Goto',
      d = {
        '<Cmd>LspTypeDef<CR>',
        'Type Definition',
        buffer = bufnr,
      },
      n = {
        '<Cmd>Lspsaga diagnostic_jump_next<CR>',
        'Next issue',
        buffer = bufnr,
      },
      N = {
        '<Cmd>Lspsaga diagnostic_jump_prev<CR>',
        'Previous issue',
        buffer = bufnr,
      },
    },
    h = {
      name = 'Hover Menu',
      f = {
        '<Cmd>Lspsaga lsp_finder<CR>',
        'Find all',
        buffer = bufnr,
      },
      d = {
        '<Cmd>Lspsaga hover_doc<CR>',
        'Show docs',
        buffer = bufnr,
      },
      l = {
        '<Cmd>Lspsaga show_line_diagnostics<CR>',
        'Show line diagnostics',
        buffer = bufnr,
      },
      c = {
        '<Cmd>Lspsaga show_cursor_diagnostics<CR>',
        'Show diagnostic under cursor',
        buffer = bufnr,
      },
      p = {
        '<Cmd>Lspsaga peek_definition<CR>',
        'Peek at definition',
        buffer = bufnr,
      },
    },
    l = {
      name = 'Lint',
      f = {
        '<Cmd>LspFormatting<CR>',
        'Fix issues',
        buffer = bufnr,
      },
    },
    L = {
      name = 'LSP',
      r = {
        '<Cmd>LspRestart<CR>',
        'Restart LSP server',
        buffer = bufnr,
      },
    },
    r = {
      name = 'Rename',
      n = {
        '<Cmd>Lspsaga rename<CR>',
        'Rename variable under cursor',
        buffer = bufnr,
      },
    },
    [','] = {
      '<Cmd>Lspsaga code_action<CR>',
      'Code action menu',
      buffer = bufnr,
    },
  }
end

local lsp_keymap = {}

lsp_keymap.setup = function(bufnr)
  if wk_ok then
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.cmd(
      'command! LspFormatting lua vim.lsp.buf.format({ timeout_ms = 2000 })'
    )
    vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
    vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
    vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')

    wk.register(make_mappings(bufnr), { prefix = '<Leader>' })
  else
    vim.cmd([[
        echohl ErrorMsg
        echo "Error occurred while loading lsp keymap, is which-key installed?"
        echohl None
    ]])
  end
end

return lsp_keymap
