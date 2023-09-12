-- local wk = require('which-key')

-- Key mappings
-- wk.register({
--   prefix = '<Leader>',
--   t = {
--     t = {
--       '<Cmd>NvimTreeToggle<CR>',
--       'Toggle tree open',
--     },
--   },
-- })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.api.nvim_set_keymap(
  'n',
  '<Leader>tt',
  ':NvimTreeToggle<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Leader>tR',
  ':NvimTreeRefresh<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Leader>tc',
  ':NvimTreeClose<CR>',
  { noremap = true, silent = true }
) -- Close

-- Settings
require('nvim-tree').setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  sort = { sorter = 'case_sensitive' },
  view = {
    float = { enable = true },
    width = 35,
    side = 'left',
    preserve_window_proportions = true,
  },
  renderer = {
    add_trailing = true,
    root_folder_label = false,
    special_files = {
      -- Disable for now, need to figure out what files to use
    },
    highlight_git = true,
    highlight_diagnostics = true,
    highlight_opened_files = 'icon',
    highlight_modified = 'icon',
    indent_markers = { enable = true },
  },
  filters = { git_ignored = false },
  actions = { change_dir = { enable = false, restrict_above_cwd = true } },
})

-- Ignore specific files
vim.g.nvim_tree_ignore = { '.DS_Store' }

-- Show hidden files
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
