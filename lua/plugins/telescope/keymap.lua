local utils = require('utils')
local invariant_require = utils.invariant_require

local builtin = invariant_require('telescope.builtin')
local wk = require('which-key')
local opts = { noremap = true, silent = true }

-- additional commands to map:
-- https://github.com/nvim-telescope/telescope.nvim#pickers

local wk_mappings = {
  prefix = '<Leader>',
  f = {
    name = 'Telescope',
    z = {
      '<Cmd>Telescope<CR>',
      'Find anything',
      opts = opts,
    },
    f = {
      builtin.find_files,
      'Find files (in git)',
      opts = opts,
    },
    F = {
      builtin.resume,
      'Resume previous file search',
      opts = opts,
    },
    R = {
      builtin.resume,
      'Resume previous search',
      opts = opts,
    },
    r = {
      builtin.lsp_references,
      'Find lsp references',
      opts = opts,
    },
    i = {
      builtin.lsp_implementations,
      'Find lsp implementations',
      opts = opts,
    },
    d = {
      builtin.lsp_definitions,
      'Find lsp definitions',
      opts = opts,
    },
    D = {
      builtin.diagnostics,
      'Display diagnostics for open buffer',
      opts = opts,
    },
    t = {
      builtin.live_grep,
      'Find by text',
      opts = opts,
    },
    T = {
      builtin.resume,
      'Resume previous text search',
      opts = opts,
    },
    w = {
      builtin.grep_string,
      'Search for word under cursor',
      opts = opts,
    },
    b = {
      builtin.buffers,
      'Find buffer',
      opts = opts,
    },
    h = {
      builtin.command_history,
      'View command history',
      opts = opts,
    },
    H = {
      builtin.search_history,
      'View search history',
      opts = opts,
    },
    q = {
      builtin.quickfix,
      'View quickfix menu',
      opts = opts,
    },
    Q = {
      builtin.quickfixhistory,
      'View quickfix history',
      opts = opts,
    },
  },
}

wk.register(wk_mappings)
