local utils = require('utils')
local invariant_require = utils.invariant_require
local telescope = invariant_require('telescope')
local actions = invariant_require('telescope.actions')
local config = invariant_require('telescope.config')

if telescope and actions then
  -- File and text search in hidden files and directories
  local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }
  table.insert(vimgrep_arguments, '--hidden')

  telescope.setup({
    defaults = {
      path_display = { 'smart' },
      vimgrep_arguments = vimgrep_arguments,
      mappings = {
        i = {
          ['<Esc>'] = actions.close,
        },
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden' },
        },
      },
    },
  })
end
