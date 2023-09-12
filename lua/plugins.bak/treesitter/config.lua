local utils = require('utils')
local invariant_require = utils.invariant_require
local ts_configs = invariant_require('nvim-treesitter.configs')

if ts_configs then
  ts_configs.setup({
    ensure_installed = {
      'go',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'jsonc',
      'lua',
      'typescript',
      'tsx',
      'vim',
      'bash',
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true, -- false will disable the whole extension
    },
    autotag = { enable = true },
    rainbow = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    -- refactor = {highlight_definitions = {enable = true}}
  })
end
