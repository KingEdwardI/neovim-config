local config = require('lsp.config')
local null_ls = require('null-ls')
local builtins = null_ls.builtins

null_ls.setup({
  sources = {
    -- Javascript
    builtins.diagnostics.eslint_d, -- eslint or eslint_d
    builtins.code_actions.eslint_d, -- eslint or eslint_d
    builtins.formatting.eslint_d, -- prettier, eslint, eslint_d, or prettierd

    -- Lua
    builtins.formatting.stylua,
    builtins.diagnostics.luacheck.with({ extra_args = { '--global vim' } }),

    builtins.completion.spell,
  },
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)')
    end

    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

    config.on_attach(client, bufnr)
  end,
})
