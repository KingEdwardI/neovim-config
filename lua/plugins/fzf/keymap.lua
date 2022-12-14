local wk = require('which-key')
local opts = { noremap = true, silent = true }

-- additional commands to map:
-- https://github.com/ibhagwan/fzf-lua#commands

local wk_mappings = {
  prefix = '<Leader>',
  f = {
    name = 'Fuzzy finder',
    z = {
      '<Cmd>FzfLua builtin<CR>',
      'Find anything',
      opts = opts,
    },
    f = {
      '<Cmd>FzfLua git_files<CR>',
      'Find files (in git)',
      opts = opts,
    },
    a = {
      '<Cmd>FzfLua files<CR>',
      'Find any file',
      opts = opts,
    },
    R = {
      '<Cmd>FzfLua resume<CR>',
      'Resume previous search',
      opts = opts,
    },
    r = {
      '<Cmd>FzfLua lsp_references<CR>',
      'Find lsp references',
      opts = opts,
    },
    i = {
      '<Cmd>FzfLua lsp_implementations<CR>',
      'Find lsp implementations',
      opts = opts,
    },
    d = {
      '<Cmd>FzfLua lsp_definitions<CR>',
      'Find lsp definitions',
      opts = opts,
    },
    t = {
      '<Cmd>FzfLua live_grep<CR>',
      'Find by text',
      opts = opts,
    },
    T = {
      '<Cmd>FzfLua live_grep_resume<CR>',
      'Resume previous text search',
      opts = opts,
    },
    w = {
      '<Cmd>FzfLua grep_cword<CR>',
      'Search for word under cursor',
      opts = opts,
    },
    b = {
      '<Cmd>FzfLua buffers<CR>',
      'Find buffer',
      opts = opts,
    },
  },
}

wk.register(wk_mappings)
