-- keymaps must be loaded separately from the configs
-- so that lazy loaded plugins can be activated on command
local utils = require('utils')
local set_keymap = utils.set_keymap

vim.g.mapleader = ','

-- Remap hjkl movement keys for Dvorak & personal preference
set_keymap('', 'h', '<Left>', {})
set_keymap('', 't', '<Up>', {})
set_keymap('', 'T', '8<Up>', {})
set_keymap('', 'n', '<Down>', {})
set_keymap('', 'N', '8<Down>', {})
set_keymap('', 's', '<Right>', {})

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
set_keymap('n', 'gb', ':bnext<CR>', {})
set_keymap('n', 'gB', ':bprevious<CR>', {})

require('barbar.keymap')
require('choosewin.keymap')
require('diff-view.keymap')
require('fix-json.keymap')
require('fzf.keymap')
require('git-blame.keymap')
require('markdown-preview.keymap')
require('minimap.keymap')
require('nvim-tree-cfg.keymap')
require('trouble-cfg.keymap')
require('vim-commentary.keymap')
require('vim-which-key.keymap')
require('nvim-spectre.keymap')
