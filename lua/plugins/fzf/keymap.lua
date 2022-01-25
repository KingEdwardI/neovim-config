local utils = require('utils')
local set_keymap = utils.set_keymap
local opts = { noremap = true, silent = true }

set_keymap('n', '<Leader>fz', '<Cmd>FzfLua builtin<CR>', opts)
set_keymap('n', '<Leader>ff', "<Cmd>lua require('fzf-lua').git_files()<CR>", opts)
set_keymap('n', '<Leader>fa', "<Cmd>lua require('fzf-lua').files()<CR>", opts)
set_keymap('n', '<Leader>fA', "<Cmd>lua require('fzf-lua').files_resume()<CR>", opts)
set_keymap('n', '<Leader>fr', "<Cmd>lua require('fzf-lua').lsp_references()<CR>", opts)
set_keymap('n', '<Leader>fi', "<Cmd>lua require('fzf-lua').lsp_implementations()<CR>", opts)
set_keymap('n', '<Leader>fd', "<Cmd>lua require('fzf-lua').lsp_definitions()<CR>", opts)
set_keymap('n', '<Leader>ft', "<Cmd>lua require('fzf-lua').live_grep()<CR>", opts)
set_keymap('n', '<Leader>fT', "<Cmd>lua require('fzf-lua').live_grep_resume()<CR>", opts)
set_keymap('n', '<Leader>fw', "<Cmd>lua require('fzf-lua').grep_cword()<CR>", opts)
set_keymap('n', '<Leader>fb', "<Cmd>lua require('fzf-lua').buffers()<CR>", opts)
