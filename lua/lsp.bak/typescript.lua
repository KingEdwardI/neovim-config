local config = require('lsp.config')
local utils = require('utils')

local invariant_require = utils.invariant_require
local buf_map = utils.buf_map
local check_neovim_exists = utils.check_neovim_exists
local get_node_version = utils.get_node_version

local coq = require('plugins.coq-nvim.config')
local lspconfig = invariant_require('lspconfig')
local typescript = invariant_require('typescript')
local twoslash = invariant_require('twoslash-queries')

if not twoslash then
  print('twoslash-queries is not available!')
end

if lspconfig and typescript then
  local node_version = get_node_version()

  local neovim_exists = check_neovim_exists(node_version)

  if neovim_exists == 'false' then
    local base_packages = {
      'neovim',
      'typescript',
      'typescript-language-server',
      'eslint',
      'eslint_d',
    }
    local additional_packages = { 'cspell', 'markdownlint-cli', 'markdownlint' }
    local install_neovim = io.popen(
      'npm install --location=global -g'
        .. ' '
        .. table.concat(base_packages, ' ')
        .. ' '
        .. table.concat(additional_packages, ' ')
    )
    if install_neovim then
      install_neovim:close()
    end
  end

  --speed up finding the neovim node library
  vim.cmd(
    "let g:node_host_prog = '/Users/edward.vetterdrake/.nvm/versions/node/"
      .. node_version
      .. "/bin/neovim-node-host'"
  )

  typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, --enable debug logging for commands
    go_to_source_definition = {
      fallback = true, -- fall back to standard LSP definition on failure
    },
    server = coq.lsp_ensure_capabilities({
      -- pass options to lspconfig's setup method
      on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false

        buf_map(bufnr, 'n', '<Leader>ii', ':TypescriptAddMissingImports<CR>')
        buf_map(bufnr, 'n', '<Leader>rN', ':TypescriptRenameFile<CR>')

        if twoslash then
          twoslash.attach(client, bufnr)
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
      preferences = {
        quotePreference = 'single',
        includeCompletionsForImportStatements = true,
        importModuleSpecifierPreference = 'project-relative',
      },
    }),
  })
end
