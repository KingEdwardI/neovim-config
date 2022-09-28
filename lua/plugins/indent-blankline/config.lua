local utils = require('utils')
local invariant_require = utils.invariant_require
local indent_blankline = invariant_require('indent_blankline')

if indent_blankline then
  vim.opt.termguicolors = true
  vim.cmd([[
  highlight IndentBlanklineIndent1 guifg=#52050b gui=nocombine
  highlight IndentBlanklineIndent2 guifg=#4f3403 gui=nocombine
  highlight IndentBlanklineIndent3 guifg=#1a3806 gui=nocombine
  highlight IndentBlanklineIndent4 guifg=#053b42 gui=nocombine
  highlight IndentBlanklineIndent5 guifg=#0b3252 gui=nocombine
  highlight IndentBlanklineIndent6 guifg=#380647 gui=nocombine
  ]])

  -- In case I want to highlight the background
  -- vim.cmd([[
  -- highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine
  -- highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine
  -- ]])
  --

  indent_blankline.setup({
    space_char_blankline = ' ',
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
    },
    -- In case I want to highlight the background
    -- char = '',
    -- char_highlight_list = {
    --   'IndentBlanklineIndent1',
    --   'IndentBlanklineIndent2',
    -- },
    -- space_char_highlight_list = {
    --   'IndentBlanklineIndent1',
    --   'IndentBlanklineIndent2',
    -- },
    -- show_trailing_blankline_indent = false,
  })
end
