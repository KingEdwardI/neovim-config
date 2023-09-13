local utils = require('utils')
local config = require('plugins.language-support.common')
local eslint_d_config =
    require('plugins.language-support.efm-langserver.eslint_d')
local invariant_require = utils.invariant_require

local lspconfig = invariant_require('lspconfig')
local stylua_formatter = invariant_require('efmls-configs.formatters.stylua')
local prettier_formatter =
    invariant_require('efmls-configs.formatters.prettier')
local yamllint_linter = invariant_require('efmls-configs.linters.yamllint')
local markdownlint_linter =
    invariant_require('efmls-configs.linters.markdownlint')
local shellcheck_linter = invariant_require('efmls-configs.linters.shellcheck')

local rootMarkers = { '.git/', 'package.json' }

if lspconfig then
  local cwd = debug.getinfo(1).source:match("@?(.*/)")
  print(cwd)
  os.execute("export PATH=$PATH:/usr/local/bin/efm-langserver")

  lspconfig.efm.setup({
    cmd = { 'efm-langserver' },
    initializationOptions = {
      documentFormatting = true,
      hover = true,
      codeAction = true,
      completion = true,
    },
    root_dir = function(fname)
      print('rootdir')
      print(lspconfig.util.root_pattern(unpack(rootMarkers))(fname))
      print(lspconfig.util.path.dirname(fname))
      return lspconfig.util.root_pattern(unpack(rootMarkers))(fname)
          or lspconfig.util.path.dirname(fname)
    end,
    settings = {
      rootMarkers = rootMarkers,
      languages = {
        lua = { stylua_formatter },
        prettier = { prettier_formatter },
        yaml = { yamllint_linter },
        markdown = { markdownlint_linter },
        bash = { shellcheck_linter },
        eslint_d = eslint_d_config,
      },
    },
    filetypes = { 'lua', 'python', 'javascript', 'typescript', 'rust' },
    on_attach = function(client, bufnr)
      vim.lsp.handlers['textDocument/publishDiagnostics'] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
          })
      config.on_attach(client, bufnr)
    end,
  })
end
