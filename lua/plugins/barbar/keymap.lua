local utils = require('utils')
local set_keymap = utils.set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
set_keymap('n', 'gt', ':BufferNext<CR>', opts)
set_keymap('n', 'gT', ':BufferPrevious<CR>', opts)

-- Re-order to previous/next
set_keymap('n', ',gm', ':BufferMoveNext<CR>', opts)
set_keymap('n', ',gM', ':BufferMovePrevious<CR>', opts)

-- Goto buffer in position...
set_keymap('n', ',g1', ':BufferGoto 1<CR>', opts)
set_keymap('n', ',g2', ':BufferGoto 2<CR>', opts)
set_keymap('n', ',g3', ':BufferGoto 3<CR>', opts)
set_keymap('n', ',g4', ':BufferGoto 4<CR>', opts)
set_keymap('n', ',g5', ':BufferGoto 5<CR>', opts)
set_keymap('n', ',g6', ':BufferGoto 6<CR>', opts)
set_keymap('n', ',g7', ':BufferGoto 7<CR>', opts)
set_keymap('n', ',g8', ':BufferGoto 8<CR>', opts)
set_keymap('n', ',g9', ':BufferGoto 9<CR>', opts)
set_keymap('n', ',g0', ':BufferLast<CR>', opts)

-- Close buffer
set_keymap('n', ',gc', ':BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
set_keymap('n', ',gp', ':BufferPick<CR>', opts)

-- Sort automatically by...
set_keymap('n', ',bsn', ':BufferOrderByBufferNumber<CR>', opts)
set_keymap('n', ',bsd', ':BufferOrderByDirectory<CR>', opts)
set_keymap('n', ',bsl', ':BufferOrderByLanguage<CR>', opts)
