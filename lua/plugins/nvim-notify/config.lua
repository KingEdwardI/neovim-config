local utils = require('utils')
local invariant_require = utils.invariant_require
local nvim_notify = invariant_require('notify')
local telescope = invariant_require('telescope')

if nvim_notify and telescope then
  vim.notify = nvim_notify

  nvim_notify.setup({
    timeout = 7500,
    stages = 'fade',
  })
  telescope.load_extension('notify')
end
