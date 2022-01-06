local config = require('lsp.config')

require('lspconfig').pyright.setup({
  on_attach = config.on_attach,
})
