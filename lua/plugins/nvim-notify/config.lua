local utils = require('utils')
local invariant_require = utils.invariant_require
local nvim_notify = invariant_require('notify')

if (nvim_notify) then
  vim.notify = nvim_notify

  nvim_notify.setup({
    timeout = 7500,
    stages = 'fade',
  })
end
