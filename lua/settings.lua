vim.cmd([[
" treat dash separated words as a word text object
set iskeyword+=-

"Show character for soft wrapped lines
set breakindent showbreak=┕→ 

" Don't use stupid tabs
set expandtab
set tabstop=2

" start scrolling 5 lines before cursor reaches the edge
set scrolloff=5

" set foldmethod and open all folds
set foldmethod=indent
set foldlevelstart=99

let g:python3_host_prog = '/usr/local/bin/python3'

" Set filetype to bash for zsh files because the syntax highlighting is better
autocmd FileType zsh :set ft=bash
]])

-- hello-world

-- Global options
vim.o.number = true
vim.o.linebreak = true
vim.o.spelllang = 'en,cjk'
vim.o.syntax = 'on'
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.hidden = true --Required to keep multiple buffers open multiple buffers
vim.o.mouse = 'a' --Enable your mouse
vim.o.splitbelow = true --Horizontal splits will automatically be below
vim.o.splitright = true --Vertical splits will automatically be to the right
vim.o.termguicolors = true
vim.go.t_Co = '256' --Support 256 colors
vim.o.showmode = false --We don't need to see things like -- INSERT -- anymore
vim.o.updatetime = 300 --Faster completion
vim.o.timeoutlen = 500 --By default timeoutlen is 1000 ms

-- Buffer options
vim.bo.expandtab = true --Converts tabs to spaces
vim.bo.smartindent = true --Makes indenting smart

-- Window options
vim.wo.cursorline = true --Enable highlighting of the current line
vim.wo.signcolumn = 'yes' --Always show the signcolumn, otherwise it would shift the text each time

-- Disable things to help startup time

local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end
