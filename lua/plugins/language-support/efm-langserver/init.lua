local utils = require('utils')
local config = require('plugins.language-support.common')
local invariant_require = utils.invariant_require

local lsp = invariant_require('lspconfig')
local rootMarkers = { '.git/', 'package.json' }

if lsp then
  lsp.efm.setup({
    cmd = { 'efm-langserver' },
    init_options = { documentFormatting = true },
    root_dir = function(fname)
      return lspconfig.util.root_pattern(unpack(rootMarkers))(fname)
        or lspconfig.util.path.dirname(fname)
    end,
    settings = {
      rootMarkers = rootMarkers,
      languages = {
        lua = { { formatCommand = 'stylua', formatStdin = true } },
      },
    },
    filetypes = { 'lua', 'python', 'javascript', 'typescript', 'rust' },
    on_attach = config.on_attach,
  })
end
