local utils = require('utils')
local invariant_require = utils.invariant_require

vim.g.coq_settings = {
  auto_start = 'shut-up',
  clients = {
    lsp = {
      resolve_timeout = 0.10
    }
  }
  -- keymap = {
  --   ['repeat'] = '<Leader>a',
  --   bigger_preview = { '<Leader>o' },
  -- },
}

-- coq must be imported _after_ the settings are set or else
-- auto start doesn't work.
local coq = invariant_require('coq')
if coq then
  return coq
end
