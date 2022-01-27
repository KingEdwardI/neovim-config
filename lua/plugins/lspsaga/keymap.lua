vim.cmd([[
" command! LspsagaScrollUp lua require('lspsaga.action').smart_scroll_with_saga(-1)
" command! LspsagaScrollDown lua require('lspsaga.action').smart_scroll_with_saga(1)

" function! CheckForSagaWindowAndSetKeyMap()

"   let non_float_wins = len(filter(nvim_list_wins(), {k, v -> nvim_win_get_config(v).relative == ''}))
"   let total_wins = winnr('$')
"   let float_wins = total_wins - non_float_wins
"   let bufs = nvim_list_bufs()
"   let latest_buf = bufs[len(bufs) - 1]

"   let latest_buf_filetype = nvim_buf_get_option(latest_buf, 'filetype')

"   if latest_buf_filetype == 'sagahover'
"     nnoremap <buffer> t :LspsagaScrollUp<CR>
"     nnoremap <buffer> n :LspsagaScrollDown<CR>
"   endif

" endfunction

" function! CheckForSagaWindowAndUnsetSetKeyMap()

"   let non_float_wins = len(filter(nvim_list_wins(), {k, v -> nvim_win_get_config(v).relative == ''}))
"   let total_wins = winnr('$')
"   let float_wins = total_wins - non_float_wins
"   let bufs = nvim_list_bufs()
"   let latest_buf = bufs[len(bufs) - 1]

"   let latest_buf_filetype = nvim_buf_get_option(latest_buf, 'filetype')

"   if latest_buf_filetype == 'sagahover'
"     nnoremap <buffer> t <Up>
"     nnoremap <buffer> n <Down>
"   endif

" endfunction

" autocmd BufAdd * :call CheckForSagaWindowAndSetKeyMap() | echo "added buf"
" autocmd BufWinEnter * :echo "added buf"
" autocmd BufWinLeave * :call CheckForSagaWindowAndUnsetSetKeyMap() | echo "removed buf"
" autocmd WinLeave * :echo "removed buf"
]])
