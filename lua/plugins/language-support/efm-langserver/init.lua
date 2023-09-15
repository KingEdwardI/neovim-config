local utils = require('utils')
local config = require('plugins.language-support.common')
local invariant_require = utils.invariant_require

local lspconfig = invariant_require('lspconfig')
local stylua_formatter = invariant_require('efmls-configs.formatters.stylua')
local prettier_formatter =
    invariant_require('efmls-configs.formatters.prettier')
local yamllint_linter = invariant_require('efmls-configs.linters.yamllint')
local markdownlint_linter =
    invariant_require('efmls-configs.linters.markdownlint')
local shellcheck_linter = invariant_require('efmls-configs.linters.shellcheck')

local luacheck_linter = invariant_require('efmls-configs.linters.luacheck')
local eslint_d_linter = invariant_require('efmls-configs.linters.eslint_d')
local eslint_d_formatter =
    invariant_require('efmls-configs.formatters.eslint_d')

local rootMarkers = { '.git/', 'package.json' }

if lspconfig then
  os.execute('export PATH=$PATH:/usr/local/bin/efm-langserver')

  lspconfig.efm.setup({
    cmd = { 'efm-langserver' },
    initializationOptions = {
      documentFormatting = true,
      hover = true,
      codeAction = true,
      completion = true,
    },
    root_dir = function(fname)
      return lspconfig.util.root_pattern(unpack(rootMarkers))(fname)
          or lspconfig.util.path.dirname(fname)
    end,
    init_options = { documentFormatting = true },

    settings = {
      lintDebounce = 500,
      rootMarkers = rootMarkers,
      languages = {
        lua = { stylua_formatter, luacheck_linter },
        prettier = { prettier_formatter },
        yaml = { yamllint_linter },
        markdown = { markdownlint_linter },
        bash = { shellcheck_linter },
        typescript = { eslint_d_linter, eslint_d_formatter },
        javascript = { eslint_d_linter, eslint_d_formatter },
        typescriptreact = { eslint_d_linter, eslint_d_formatter },
        ['typescript.tsx'] = { eslint_d_linter, eslint_d_formatter },
        javascriptreact = { eslint_d_linter, eslint_d_formatter },
        ['javascript.jsx'] = { eslint_d_linter, eslint_d_formatter },
        -- Todo: Rust, Python, ...Others?
      },
    },
    filetypes = {
      'lua',
      'python',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'rust',
    },
    on_attach = function(client, bufnr)
      vim.lsp.handlers['textDocument/publishDiagnostics'] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
          })
      config.on_attach(client, bufnr)
    end,
  })
end
