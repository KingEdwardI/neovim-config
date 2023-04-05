local wk = require('which-key')

wk.register({
  prefix = '<Leader>',
  t = {
    t = {
      '<Cmd>CHADopen<CR>',
      'Toggle tree open',
    },
  },
})

-- Todo: make an autocommand to focus on the open file when switching to the tree via <c-w><c-w>
-- vim.cmd([[
-- autocmd BufEnter,FileType CHADtree :normal ,tJ
-- ]])

vim.api.nvim_set_var('chadtree_settings', {
  keymap = {
    refresh = { '<Leader>tR' },
    change_focus = { '<Nop>' },
    change_focus_up = { '<Nop>' },
    change_dir = { '<Leader>^' },
    tertiary = { 't' },
    v_split = { '<Leader>v' },
    h_split = { '<Leader>s' },
    open_sys = { '<Leader>o' },
    collapse = { '<S-Tab>', '<Backspace>' },
    jump_to_current = { ',tJ' },
    stat = { '<Leader>ls' },
    copy = { 'c' },
    toggle_hidden = { '<Nop>' },
    toggle_follow = { '<Nop>' },
    trash = { '<Nop>' },
  },
  theme = {
    -- to get correct coloring, LS_COLORS need to be set in the env.
    -- I'm using https://github.com/sharkdp/vivid to generate the colors.
    -- (specifically dracula theme)
    -- Todo: Some kind of check for if all requirements are available.
    text_colour_set = 'env',
  },
  options = {
    follow = false,
    show_hidden = true,
  },
  ignore = {
    name_exact = { '.DS_Store' },
  },
  view = {
    window_options = {
      signcolumn = 'no',
    },
  },
})
