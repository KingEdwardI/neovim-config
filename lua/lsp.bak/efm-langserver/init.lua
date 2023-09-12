local utils = require('utils')
local invariant_require = utils.invariant_require

local lsp = invariant_require('lspconfig')

-- Todo: ensure that efm-langserver is installed via brew before attempting to use it.

if not lsp then
  return
end

lsp.efm.setup({
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      lua = {
        { formatCommand = 'stylua', formatStdin = true },
      },
    },
  },
})
