return function(use)
  --[[
  -- impatient.nvim - speeds up startup times
  -- https://github.com/lewis6991/impatient.nvim.git
  --]]
  use('lewis6991/impatient.nvim')

  --[[
  -- vim-repeat - remaps `.` in a way that plugins can tap into it.
  -- https://github.com/tpope/vim-repeat#repeatvim
  --]]
  use('tpope/vim-repeat')

  --[[
  -- vim-sleuth - automatically adjusts 'shiftwidth' and 'expandtab'
  -- heuristically based on the current file.
  -- https://github.com/tpope/vim-sleuth#notes
  --]]
  --
  use('tpope/vim-sleuth')

  --[[
  -- vim-surround - provides mappings to easily delete, change and add such surroundings in pairs.
  -- https://github.com/tpope/vim-surround#surroundvim
  --]]
  use('tpope/vim-surround')

  --[[
  -- vim-matchup - extends the `%` command
  -- https://github.com/andymass/vim-matchup
  --]]
  use({
    'andymass/vim-matchup',
    opt = true,
    event = 'InsertEnter',
  })

  --[[
  -- vim-visual-multi - multiple cursors
  -- https://github.com/mg979/vim-visual-multi
  --]]
  use('mg979/vim-visual-multi')

  --[[
  -- vim_current_word - highlight matches to the word under the cursor
  -- https://github.com/dominikduda/vim_current_word
  --]]
  use({
    'dominikduda/vim_current_word',
    config = function()
      require('plugins.core.vim-current-word')
    end,
  })

  --[[
  -- vim-choosewin - choose which window to jump to
  -- https://github.com/t9md/vim-choosewin
  --]]
  use({
    't9md/vim-choosewin',
    config = function()
      require('plugins.core.choosewin')
    end,
  })

  --[[
  -- nvim-autopairs - automatically close brackets
  -- https://github.com/windwp/nvim-autopairs
  --]]
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.core.auto-pairs')
    end,
  })

  --[[
  -- nvim-treesitter
  -- https://github.com/nvim-treesitter/nvim-treesitter
  --]]
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.core.treesitter')
    end,
  })

  --[[
  -- Comment.nvim - easy commenting
  -- https://github.com/numToStr/Comment.nvim
  --]]
  use({
    'numToStr/Comment.nvim',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function()
      require('plugins.core.comment')
    end,
  })

  --[[
  -- trouble.nvim - a diagnostics view
  -- https://github.com/folke/trouble.nvim
  --]]
  use({
    'folke/trouble.nvim',
    config = function()
      require('plugins.core.trouble')
    end,
  })

  --[[
  -- coq-nvim - Fast as FUCK autocompletion
  -- https://github.com/ms-jpq/coq-nvim
  --]]
  use({
    'ms-jpq/coq_nvim',
    branch = 'coq',
    run = ':COQdeps',
    config = function()
      require('plugins.core.coq-nvim')
    end,
  })

  use({
    'ms-jpq/coq.artifacts',
    branch = 'artifacts',
    requires = 'ms-jpq/coq-nvim',
  })

  use({
    'ms-jpq/coq.thirdparty',
    branch = '3p',
    requires = 'ms-jpq/coq-nvim',
  })

  --[[
  -- indent-blankline.nvim - indentation guides
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  --]]
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.core.indent-blankline')
    end,
  })

  --[[
    -- pretty-fold.nvim - customized line folding
   -- https://github.com/anuvyklack/pretty-fold.nvim
  --]]
  use({
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('plugins.core.pretty-fold')
    end,
  })

  --[[
  -- nvim-spectre - search/replace tool
  -- https://github.com/nvim-pack/nvim-spectre
  --]]
  use('windwp/nvim-spectre')
end
