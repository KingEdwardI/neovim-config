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

  --[[
  -- efmls-configs-nvim - some default configs for efmls
  -- https://github.com/creativenull/efmls-configs-nvim
  --]]
  use({ 'creativenull/efmls-configs-nvim' })

  require('plugins.language-support.lua')
  require('plugins.language-support.typescript')
  require('plugins.language-support.efm-langserver')
  --[[
  -- twoslash-queries.nvim - use a comment to show a typedef with your cursor free
  -- https://github.com/marilari88/twoslash-queries.nvim
  --]]
  use({ 'marilari88/twoslash-queries.nvim' })
end
