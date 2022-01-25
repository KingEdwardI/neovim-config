local utils = require('utils')
local invariant_require = utils.invariant_require

invariant_require('impatient')

-- local present = pcall(require, 'impatient')

-- if not present then
--   print('not present')
--   return false
-- end

require('plugins')
require('keymappings')
require('settings')
