local utils = require('utils')
local invariant_require = utils.invariant_require
local nvim_tree = invariant_require('nvim-tree')
local tree_config = invariant_require('nvim-tree.config')

if nvim_tree and tree_config then
  local tree_cb = tree_config.nvim_tree_callback

  nvim_tree.setup({
    -- disables netrw
    disable_netrw = true,
    -- prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
    hijack_netrw = true,
    -- open the tree when running this setup function
    open_on_setup = false,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup = {},
    -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    open_on_tab = true,
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = true,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_cwd = false,
    -- show lsp diagnostics in the signcolumn
    diagnostics = { enable = true },
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
      -- enables the feature
      enable = true,
      -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
      -- only relevant when `update_focused_file.enable` is true
      update_cwd = false,
      -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
      -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
      ignore_list = {},
    },
    git = {
      ignore = false,
      enable = true,
    },
    -- configuration options for the system open command (`s` in the tree by default)
    system_open = {
      -- the command to run this, leaving nil should work in most cases
      cmd = nil,
      -- the command arguments as a list
      args = {},
    },
    filters = {
      dotfiles = false,
    },

    view = {
      -- width of the window, can be either a number (columns) or a string in `%`
      width = 35,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = 'left',
      mappings = {
        -- custom only false will merge the list with the default mappings
        -- if true, it will only use your list to set the mappings
        custom_only = true,
        -- list of mappings to set on the tree manually
        list = {
          { key = { '<CR>', 'o', '<2-LeftMouse>' }, cb = tree_cb('edit') },
          { key = { '<2-RightMouse>', '<C-]>' }, cb = tree_cb('cd') },
          { key = '<C-v>', cb = tree_cb('vsplit') },
          { key = '<C-x>', cb = tree_cb('split') },
          { key = '<C-t>', cb = tree_cb('tabnew') },
          { key = '<', cb = tree_cb('prev_sibling') },
          { key = '>', cb = tree_cb('next_sibling') },
          { key = 'P', cb = tree_cb('parent_node') },
          { key = '<BS>', cb = tree_cb('close_node') },
          { key = '<S-CR>', cb = tree_cb('close_node') },
          { key = '<Tab>', cb = tree_cb('preview') },
          { key = 'K', cb = tree_cb('first_sibling') },
          { key = 'J', cb = tree_cb('last_sibling') },
          { key = 'I', cb = tree_cb('toggle_ignored') },
          { key = 'H', cb = tree_cb('toggle_dotfiles') },
          { key = 'R', cb = tree_cb('refresh') },
          { key = 'a', cb = tree_cb('create') },
          { key = 'd', cb = tree_cb('remove') },
          { key = 'r', cb = tree_cb('rename') },
          { key = '<C-r>', cb = tree_cb('full_rename') },
          { key = 'x', cb = tree_cb('cut') },
          { key = 'c', cb = tree_cb('copy') },
          { key = 'p', cb = tree_cb('paste') },
          { key = 'y', cb = tree_cb('copy_name') },
          { key = 'Y', cb = tree_cb('copy_path') },
          { key = 'gy', cb = tree_cb('copy_absolute_path') },
          { key = '[c', cb = tree_cb('prev_git_item') },
          { key = ']c', cb = tree_cb('next_git_item') },
          { key = '^', cb = tree_cb('dir_up') },
          { key = 's', cb = tree_cb('system_open') },
          { key = 'q', cb = tree_cb('close') },
          { key = 'g?', cb = tree_cb('toggle_help') },
        },
      },
    },
    actions = {
      use_system_clipboard = false,
    },
  })

  --        | nvim_tree_bindings

  -- vim.g.nvim_tree_ignore = []
  -- this option shows indent markers when folders are open
  vim.g.nvim_tree_indent_markers = 1
  -- will enable file highlight for git attributes (can be used without the icons)
  vim.g.nvim_tree_git_hl = 1
  -- will enable folder and file icon highlight for opened files/directories
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_root_folder_modifier = ':~'
  -- append a trailing slash to folder names
  vim.g.nvim_tree_add_trailing = 1
  -- compact folders that only contain a single folder into one node in the file tree
  vim.g.nvim_tree_group_empty = 0
  -- will disable the window picker
  vim.g.nvim_tree_disable_window_picker = 0
  -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
  vim.g.nvim_tree_icon_padding = ' '
  -- used as a separator between symlinks' source and target
  vim.g.nvim_tree_symlink_arrow = ' ➛ '
  -- will change cwd of nvim-tree to that of new buffer's when opening nvim-tree
  vim.g.nvim_tree_respect_buf_cwd = 0
  --  control how often the tree can be refreshed, in ms
  vim.g.nvim_tree_refresh_wait = 1000
  -- Dictionary of buffer option names mapped to a list of option values that
  -- indicates to the window picker that the buffer's window should not be selectable.
  vim.g.nvim_tree_window_picker_exclude = {
    -- filetype = [],
    -- buftype = []
  }
  -- List of filenames that gets highlighted with NvimTreeSpecialFile
  vim.cmd([[
let g:nvim_tree_special_files = { "README.md": 1 }
]])
  -- If 0, do not show the icons for one of 'git' 'folder' and 'files'.
  -- 1 by default, notice that if 'files' is 1, it will only display if nvim-web-devicons is installed and on your runtimepath.
  -- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
  -- but this will not work when you set indent_markers (because of UI conflict)
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  }
  -- default will show icon by default if no icon is provided
  -- default shows no icon by default
  vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = '✗',
      staged = '✓',
      unmerged = '',
      renamed = '➜',
      untracked = '★',
      deleted = '',
      ignored = '◌',
    },
    folder = {
      arrow_open = '',
      arrow_closed = '',
      default = '',
      open = '',
      empty = '',
      empty_open = '',
      symlink = '',
      symlink_open = '',
    },
    lsp = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  }

  -- this variable must be enabled for colors to be applied properly
  vim.cmd('set termguicolors')

  -- a list of groups can be found at `:help nvim_tree_highlight`
  vim.cmd([[
    :highlight NvimTreeFolderIcon guibg=blue
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  ]])
end
