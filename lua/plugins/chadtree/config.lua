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

vim.api.nvim_set_var('chadtree_settings', {
  keymap = {
    refresh = { '<Leader>tR' },
    change_focus = { '<Nop>' },
    change_focus_up = { '<Nop>' },
    change_dir = { '<Nop>' },
    tertiary = { 't', '<middlemouse>' },
    v_split = { '<Leader>v' },
    h_split = { '<Leader>s' },
    open_sys = { '<Leader>o' },
    collapse = { '<S-Tab>', '<Backspace>' },
    jump_to_current = {',tJ'},
    stat = { '<Leader>ls' },
    copy = { 'c' },
    toggle_hidden = { '<Nop>' },
    toggle_follow = { '<Nop>' },
    trash = { '<Nop>' },
  },
  theme = {
    text_colour_set = 'trapdoor',
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
