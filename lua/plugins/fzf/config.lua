local utils = require('utils')
local invariant_require = utils.invariant_require
local fzf_lua = invariant_require('fzf-lua')

if fzf_lua then
  fzf_lua.setup({
    git = {
      files = {
        prompt = 'GFiles❯',
      },
    },
    grep = {
      prompt = 'Text❯',
    },
  })
end
