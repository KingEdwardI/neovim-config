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
  },
}

wk.register(wk_mappings)
