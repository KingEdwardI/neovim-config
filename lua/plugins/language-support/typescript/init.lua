local config = require('plugins.language-support.common')
local utils = require('utils')
local ensure_neovim_npm_installed =
  require('plugins.language-support.typescript.ensure-neovim-npm-installed')

local invariant_require = utils.invariant_require
-- local buf_map = utils.buf_map

local coq = require('plugins.core.coq-nvim')
local lspconfig = invariant_require('lspconfig')
local twoslash = invariant_require('twoslash-queries')

if lspconfig then
  ensure_neovim_npm_installed()

  lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false

      if twoslash then
        twoslash.attach(client, bufnr)
      else
        vim.notify(
          'Warning: failed to load plugin: "twoslash-queries"',
          vim.log.levels.WARN
        )
      end

      config.on_attach(client, bufnr)
    end,
    root_dir = require('lspconfig/util').root_pattern(
      'package.json',
      'tsconfig.json',
      'jsconfig.json',
      '.git'
    ),
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    hostInfo = 'neovim',
    -- Todo: go through tsserver options and nail this down
    preferences = {
      quotePreference = 'single',
      includeCompletionsForImportStatements = true,
      importModuleSpecifierPreference = 'project-relative',
    },
  }))
end
