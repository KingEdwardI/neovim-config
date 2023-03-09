local config = require('lsp.config')
local utils = require('utils')

local invariant_require = utils.invariant_require

local null_ls = invariant_require('null-ls')

if null_ls then
  local builtins = null_ls.builtins

  -- Todo: get this to put the comment on the right indentation level
  local ts_expect_error_action = {
    method = null_ls.methods.CODE_ACTION,
    filetypes = { 'typescript', 'typescriptreact' },
    generator = {
      fn = function(ctx)
        local expect_error_str_lit = '// @ts-expect-error'
        local previous_line = ctx.row - 1
        if previous_line ~= expect_error_str_lit then
          return {
            {
              title = 'Add ts-expect-error',
              action = function()
                local lines = { expect_error_str_lit }
                vim.api.nvim_buf_set_lines(
                  ctx.bufnr,
                  previous_line,
                  previous_line,
                  false,
                  lines
                )
              end,
            },
          }
        end
      end,
    },
  }

  -- local json_stringify = {}

  null_ls.setup({
    -- debug = true,
    default_timeout = 4000,
    sources = {
      -- Javascript / Typescript
      builtins.diagnostics.eslint_d, -- eslint or eslint_d
      builtins.code_actions.eslint_d, -- eslint or eslint_d
      builtins.formatting.eslint_d, -- prettier, eslint, eslint_d, or prettierd
      require('typescript.extensions.null-ls.code-actions'),
      null_ls.builtins.diagnostics.tsc,

      -- Shell
      null_ls.builtins.diagnostics.shellcheck,

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

  null_ls.register(ts_expect_error_action)
end
