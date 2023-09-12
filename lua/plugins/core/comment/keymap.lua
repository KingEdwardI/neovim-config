return function(wk)
  -- Need to override the default mapping manually so that commenting works right and doesn't accidentally
  -- trigger `c` after commenting.
  wk.register({
    prefix = '<Leader>',
    c = {
      name = 'Commenting actions',
      c = {
        '<PLug>(comment_toggle_linewise_visual)',
        'Toggle line comment',
        mode = 'v',
      },
      b = 'Toggle block comment',
      t = 'Add comment above current line',
      n = 'Add comment below current line',
    },
  })
end
