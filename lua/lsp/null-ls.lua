local config = require('lsp.config')
local utils = require('utils')

local invariant_require = utils.invariant_require

local null_ls = invariant_require('null-ls')

if null_ls then
  local builtins = null_ls.builtins

  null_ls.setup({
    -- debug = true,
    default_timeout = 4000,
    sources = {
      -- Javascript / Typescript
      builtins.diagnostics.eslint_d, -- eslint or eslint_d
      builtins.code_actions.eslint_d, -- eslint or eslint_d
      builtins.formatting.eslint_d, -- prettier, eslint, eslint_d, or prettierd
      require("typescript.extensions.null-ls.code-actions"),
      null_ls.builtins.diagnostics.tsc,

      -- Lua
      builtins.formatting.stylua,
      builtins.diagnostics.luacheck.with({ extra_args = { '--global vim' } }),

      -- Other
      null_ls.builtins.diagnostics.codespell,
      -- this one causes an error
      -- null_ls.builtins.diagnostics.misspell,
    },
    on_attach = config.on_attach,
  })
end
