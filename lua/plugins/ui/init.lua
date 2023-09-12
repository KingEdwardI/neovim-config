return function(use)
  --[[
  -- jellybeans-nvim - my favorite colorscheme ported to lua <3
  -- https://github.com/metalelf0/jellybeans-nvim
  -- https://github.com/rktjmp/lush.nvim - built with lush
  --]]
  use({
    'metalelf0/jellybeans-nvim',
    requires = 'rktjmp/lush.nvim',
    config = function()
      vim.cmd('colorscheme jellybeans-nvim')
    end,
  })

  --[[
  -- lsp-colors - fill in lsp colors if colorscheme doesn't support it
  -- https://github.com/folke/lsp-colors.nvim
  --]]
  use({
    'folke/lsp-colors.nvim',
    config = function()
      require('plugins.ui.lsp-colors')
    end,
  })

  --[[
  -- telescope.nvim - fuzzy finder
  -- https://github.com/nvim-telescope/telescope.nvim
  --]]
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'sharkdp/fd',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.ui.telescope')
    end,
  })

  --[[
  -- telescope-packer.nvim - packer extension for Telescope
  -- https://github.com/nvim-telescope/telescope-packer.nvim
  --]]
  use({
    'nvim-telescope/telescope-packer.nvim',
    requires = { 'wbthomason/packer.nvim', 'nvim-telescope/telescope.nvim' },
  })

  --[[
  -- vim-which-key - display available keybindings in a popup
  -- https://github.com/folke/which-key.nvim
  --]]
  use({
    'folke/which-key.nvim',
    config = function()
      require('plugins.ui.which-key')
    end,
  })

  --[[
  -- alpha-nvim - fancy dashboard on startup
  -- https://github.com/goolord/alpha-nvim
  --]]
  use({
    -- Temporarily using my fork of the plugin because otherwise it breaks.
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugins.ui.alpha-nvim')
    end,
  })

  --[[
  -- nvim-web-devicons - neato icons
  -- https://github.com/kyazdani42/nvim-web-devicons
  --]]
  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.ui.nvim-devicons')
    end,
  })

  --[[
  -- nvim-tree - File explorer
  -- https://github.com/nvim-tree/nvim-tree.lua
  --]]
  use({
    'nvim-tree/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugins.ui.nvim-tree')
    end,
  })

  --[[
  -- lualine - fancy status line
  -- https://github.com/hoob3rt/lualine.nvim
  --]]
  use({
    'hoob3rt/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.ui.lualine')
    end,
  })

  --[[
  -- barbar - fancy tabline
  -- https://github.com/romgrk/barbar.nvim
  --]]
  use({
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugins.ui.barbar')
    end,
  })

  --[[
-- nvim-notify - fancy & configurable notifications
-- https://github.com/rcarriga/nvim-notify
  --]]
  use({
    'rcarriga/nvim-notify',
    config = function()
      require('plugins.ui.nvim-notify')
    end,
    requires = 'nvim-telescope/telescope.nvim',
  })

  --[[
  -- lspkind-nvim - pictograms for lsp completion
  -- https://github.com/onsails/lspkind-nvim
  -- ]]
  use('onsails/lspkind-nvim')

 --[[
 -- indent-blankline.nvim - indentation guides
 -- https://github.com/lukas-reineke/indent-blankline.nvim
 --]]
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.ui.indent-blankline')
    end,
  })

  --[[
   -- pretty-fold.nvim - customized line folding
  -- https://github.com/anuvyklack/pretty-fold.nvim
 --]]
  use({
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('plugins.ui.pretty-fold')
    end,
  })

  --[[
  -- nui.nvim - general purpose UI library
  -- https://github.com/MunifTanjim/nui.nvim
  -- ]]
  --   use {
  --   'MunifTanjim/nui.nvim',
  --   requires = {'nvim-lua/plenary.nvim'},
  --     config = function()
  --     require('plugins.ui.floating-terminal')
  --     end
  -- }

  -- Todo: This had issues in the past, come back to it later.
  --[[
  -- minimap.vim - minimap
  -- https://github.com/wfxr/minimap.vim
  --]]
  -- use({
  -- 'wfxr/minimap.vim',
  -- config = function()
  -- require('plugins.ui.minimap')
  -- end,
  -- })
end
