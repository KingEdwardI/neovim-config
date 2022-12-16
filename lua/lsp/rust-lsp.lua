local utils = require('utils')
local config = require('lsp.config')
local invariant_require = utils.invariant_require

local rt = invariant_require('rust-tools')
local lsp = invariant_require('lspconfig')

if lsp then
  rt.setup({
    server = {
      on_attach = function(client, bufnr)
        config.on_attach(client, bufnr)

        -- Todo: Not sure if I'll end up needing this, everything works so far just using Lspsaga

        -- Hover actions
        -- vim.keymap.set(
        --   'n',
        --   '<C-space>',
        --   rt.hover_actions.hover_actions,
        --   { buffer = bufnr }
        -- )
        -- -- Code action groups
        -- vim.keymap.set(
        --   'n',
        --   '<Leader>a',
        --   rt.code_action_group.code_action_group,
        --   { buffer = bufnr }
        -- )
      end,
    },
  })
end
