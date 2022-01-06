local config = require('lsp.config')
local utils = require('utils')
local ts_utils = require('nvim-lsp-ts-utils')
local set_keymap = utils.set_keymap

require('lspconfig').tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    -- defaults
    ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = true,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers = higher priority
      import_all_priorities = {
        same_file = 1, -- add to existing import statement
        local_files = 1, -- git files or files with relative path markers
        buffer_content = 3, -- loaded buffer content
        buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = 'Comment',

      -- update imports on file move
      update_imports_on_move = true,
      require_confirmation_on_move = false,
      watch_dir = nil,

      -- Enable ESLint diagnostics
      eslint_enable_diagnostics = true,
      eslint_bin = 'eslint_d', -- Also doesn't work with 'eslint'

      -- Enable formatting using Prettier
      enable_formatting = true,
      formatter = 'eslint_d',
    })

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    set_keymap('n', '<leader>im', ':TSLspImportCurrent<cr>', {})
    set_keymap('n', '<leader>ii', ':TSLspImportAll<cr>', {})

    config.on_attach(client, bufnr)
  end,
  init_options = ts_utils.init_options,
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_dir = require('lspconfig/util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
