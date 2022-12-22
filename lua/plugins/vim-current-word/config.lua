vim.cmd([[
let g:vim_current_word#highlight_current_word = 1
let g:vim_current_word#highlight_delay = 100
let g:vim_current_word#highlight_only_in_focused_window = 0
autocmd BufAdd CHADTree,alpha :let b:vim_current_word_disabled_in_this_buffer = 1
hi CurrentWord guifg=#32A852 " guifg=NONE
hi CurrentWordTwins guifg=#07b037 guibg=#02260c gui=bold
]])
