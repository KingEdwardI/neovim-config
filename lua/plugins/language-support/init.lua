return function(use)
  --[[
  -- mason.nvim - LSP manager
  -- https://github.com/williamboman/mason.nvim
  --]]
  use({
    'williamboman/mason.nvim',
    requires = { 'neovim/nvim-lspconfig' },
  })

  --[[
  -- mason-lspconfig.nvim - compliments mason.nvim
  -- https://github.com/williamboman/mason-lspconfig.nvim
  --]]
  use({
    'williamboman/mason-lspconfig.nvim',
    run = ':MasonUpdate', -- :MasonUpdate updates registry contents
    config = function()
      require('plugins.language-support.mason')
    end,
  })

  --[[
  -- lsp config
  -- https://github.com/neovim/nvim-lspconfig
  --]]
  use({ 'neovim/nvim-lspconfig' })

  require('plugins.language-support.lua')
end
