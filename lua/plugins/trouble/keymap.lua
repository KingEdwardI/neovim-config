local utils = require('utils')
local invariant_require = utils.invariant_require
local trouble = invariant_require('trouble')
local wk = require('which-key')

local opts = { silent = true, noremap = true }

local wk_mappings = {
  prefix = '<Leader>',
  x = {
    name = 'Trouble diagnostic window',
    x = {
      '<Cmd>TroubleToggle<CR>',
      'Toggle Trouble menu',
      opts = opts,
    },
    w = {
      '<Cmd>Trouble workspace_diagnostics<CR>',
      'Open workspace diagnostics',
      opts = opts,
    },
    d = {
      '<Cmd>Trouble document_diagnostics<CR>',
      'Open document diagnostics',
      opts = opts,
    },
    l = {
      '<Cmd>Trouble loclist<CR>',
      'Todo: figure out what this is',
      opts = opts,
    },
    f = {
      '<Cmd>Trouble quickfix<CR>',
      'Quickfix problems',
      opts = opts,
    },
    r = {
      '<Cmd>TroubleRefresh<CR>',
      'Refresh diagnostic window',
      opts = opts,
    },
    n = {
      '<Cmd>lua vim.diagnostic.goto_next({ float = false })<CR>',
      "Go to next diagnostic"
    },
    N = {
      '<Cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>',
      "Go to next diagnostic"
    },
  },
}

wk.register(wk_mappings)
