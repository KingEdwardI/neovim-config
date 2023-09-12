--[[ ---------- IMPORTANT ---------- ]]--
-- keymaps must be loaded separately from the configs
-- so that lazy loaded plugins can be activated on command

local utils = require('utils')
local set_keymap = utils.set_keymap

vim.g.mapleader = ','

-- Remap hjkl movement keys for Dvorak & personal preference
set_keymap('', 'h', '<Left>')
set_keymap('', 't', '<Up>')
set_keymap('', 'T', '8<Up>')
set_keymap('', 'n', '<Down>')
set_keymap('', 'N', '8<Down>')
set_keymap('', 's', '<Right>')

set_keymap('i', 'hh', '<Esc>', { noremap = true })

-- jump instead of next
set_keymap('', 'j', 'n', { noremap = true })
set_keymap('', 'J', 'N', { noremap = true })

-- beginning / end of line
set_keymap('', '-', '$', { noremap = true })
set_keymap('', '_', '^', { noremap = true })

-- kill line (wrap up)
set_keymap('n', 'k', 'J', { noremap = true })

-- window navigation
set_keymap('n', 'gt', '<Cmd>bnext<CR>')
set_keymap('n', 'gT', '<Cmd>bprevious<CR>')

set_keymap('v', '<C-y>', '"+y')
set_keymap('n', '<C-Y>', '"+yy')
-- wrap all lines at the first space after the 80th column.
set_keymap('n', '<C-f>f', '<Cmd>%s/\\(.\\{80\\}.\\{-}\\s\\)/\\1\\r/g<CR>')

-- require('plugins.barbar.keymap')
-- require('plugins.choosewin.keymap')
-- require('plugins.diff-view.keymap')
-- require('plugins.fix-json.keymap')
-- require('plugins.git-blame.keymap')
-- require('plugins.lazygit.keymap')
-- require('plugins.markdown-preview.keymap')
-- require('plugins.minimap.keymap')
-- require('plugins.packer.keymap')
-- require('plugins.shellcheck.keymap')
-- require('plugins.trouble.keymap')
-- require('plugins.telescope.keymap')
-- require('plugins.nvim-spectre.keymap')
-- require('plugins.nvim-notify.keymap')
-- require('plugins.comment.keymap')
