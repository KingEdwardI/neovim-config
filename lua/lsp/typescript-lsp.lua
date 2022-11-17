local config = require('lsp.config')
local utils = require('utils')

local invariant_require = utils.invariant_require
local buf_map = utils.buf_map
local set_keymap = utils.set_keymap

local lspconfig = invariant_require('lspconfig')
local typescript = invariant_require('typescript')

if lspconfig and typescript then
  --[[
  -- Todo: get this working
  -- get the current node version
  local check_node_version = io.popen('node --version')
  local node_version = check_node_version:read('*a')
  check_node_version:close()

  -- check if neovim is install for the current node version
  local check_neovim_exists = io.popen("[ -d /Users/edward.vetterdrake/.nvm/versions/node/" .. node_version .. "/bin/neovim-node-host ]  && echo true || echo false")
  local neovim_exists = check_neovim_exists:read('*a')
  check_neovim_exists:close()

  -- and install it if it doesn't
  if (neovim_exists == 'false') then
    local install_neovim = io.popen('npm install --location=global neovim')
    install_neovim:close()
  end

  -- speed up finding the neovim node library
  -- vim.cmd([[
    -- let g:node_host_prog = '/Users/edward.vetterdrake/.nvm/versions/node/]] -- .. node_version .. [[/bin/neovim-node-host'
  -- ]])
  --]]
  --
  vim.cmd("let g:node_host_prog = '/Users/edward.vetterdrake/.nvm/versions/node/v16.17.1/bin/neovim-node-host'")

  typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
      on_attach = config.on_attach,
    },
  })

  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false

      buf_map(bufnr, 'n', '<Leader>gd', ':TypescriptGoToSourceDefinition<CR>')
      set_keymap('n', '<Leader>ii', ':TypescriptAddMissingImports<CR>')

      config.on_attach(client, bufnr)
    end,
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    root_dir = require('lspconfig/util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  })
end
