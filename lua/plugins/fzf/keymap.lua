local utils = require('utils')
local set_keymap = utils.set_keymap
local opts = { noremap = true, silent = true }

set_keymap('n', '<leader>fz', '<cmd>FzfLua builtin<CR>', opts)
set_keymap('n', '<leader>ff', "<cmd>lua require('fzf-lua').git_files()<CR>", opts)
set_keymap('n', '<leader>fa', "<cmd>lua require('fzf-lua').files()<CR>", opts)
set_keymap('n', '<leader>fA', "<cmd>lua require('fzf-lua').files_resume()<CR>", opts)
set_keymap('n', '<leader>fr', "<cmd>lua require('fzf-lua').lsp_references()<CR>", opts)
set_keymap('n', '<leader>fi', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", opts)
set_keymap('n', '<leader>fd', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", opts)
set_keymap('n', '<leader>ft', "<cmd>lua require('fzf-lua').live_grep()<CR>", opts)
set_keymap('n', '<leader>fT', "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", opts)
set_keymap('n', '<leader>fw', "<cmd>lua require('fzf-lua').grep_cword()<CR>", opts)
set_keymap('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
