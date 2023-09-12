local utils = require('utils')
local invariant_require = utils.invariant_require
local ts_configs = invariant_require('nvim-treesitter.configs')

if ts_configs then
  ts_configs.setup({
    fold = { enable = true },
    indent = { enable = true },
    ensure_installed = 'all',
    highlight = {
      enable = true, -- false will disable the whole extension
      use_languagetree = true, -- Use the language tree for better highlighting
    },
    autotag = { enable = true },
    rainbow = { enable = true },
    refactor = {
      highlight_definitions = {
        enable = true,
      },
      highlight_current_scope = {
        enable = true,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = ',rn',
        },
      },
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    -- refactor = {highlight_definitions = {enable = true}}
  })
  -- let treesitter handle folds and indents
  vim.cmd([[ 
    set foldexpr=nvim_treesitter#foldexpr() 
    set indentexpr=nvim_treesitter#indent()
  ]])
end
