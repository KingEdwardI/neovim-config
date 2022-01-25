local utils = require('utils')
local set_keymap = utils.set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
set_keymap('n', 'gt', '<Cmd>BufferNext<CR>', opts)
set_keymap('n', 'gT', '<Cmd>BufferPrevious<CR>', opts)

-- Re-order to previous/next
set_keymap('n', ',gm', '<Cmd>BufferMoveNext<CR>', opts)
set_keymap('n', ',gM', '<Cmd>BufferMovePrevious<CR>', opts)

-- Goto buffer in position...
set_keymap('n', ',g1', '<Cmd>BufferGoto 1<CR>', opts)
set_keymap('n', ',g2', '<Cmd>BufferGoto 2<CR>', opts)
set_keymap('n', ',g3', '<Cmd>BufferGoto 3<CR>', opts)
set_keymap('n', ',g4', '<Cmd>BufferGoto 4<CR>', opts)
set_keymap('n', ',g5', '<Cmd>BufferGoto 5<CR>', opts)
set_keymap('n', ',g6', '<Cmd>BufferGoto 6<CR>', opts)
set_keymap('n', ',g7', '<Cmd>BufferGoto 7<CR>', opts)
set_keymap('n', ',g8', '<Cmd>BufferGoto 8<CR>', opts)
set_keymap('n', ',g9', '<Cmd>BufferGoto 9<CR>', opts)
set_keymap('n', ',g0', '<Cmd>BufferLast<CR>', opts)

-- Close buffer
set_keymap('n', ',gc', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
set_keymap('n', ',gp', '<Cmd>BufferPick<CR>', opts)

-- Sort automatically by...
set_keymap('n', ',bsn', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
set_keymap('n', ',bsd', '<Cmd>BufferOrderByDirectory<CR>', opts)
set_keymap('n', ',bsl', '<Cmd>BufferOrderByLanguage<CR>', opts)
