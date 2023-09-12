local utils = require('utils')
local invariant_require = utils.invariant_require
local lualine = invariant_require('lualine')

if lualine then
  lualine.setup({
    options = {
      icons_enabled = true,
      -- theme = 'jellybeans-nvim',
      component_separators = { '', '' },
      section_separators = { '', '' },
      disabled_filetypes = {},
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  })
end
