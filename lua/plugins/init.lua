local utils = require('utils')
local invariant_require = utils.invariant_require
local fn = vim.fn
local PackerBootstrap

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

local packer = invariant_require('packer')

if not packer then
  vim.cmd([[
    echohl ErrorMsg
    echo "Error occured while initializing Packer"
    echohl None
    echo "You might need to re-install Packer."
    echohl MoreMsg
    echo "rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim;\\"
    echo "git clone --depth 1 https://github.com/wbthomason/packer.nvim\\"
    echo "  ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    echohl None
  ]])
  return false
end

-- Auto compile when there are changes in plugins.lua
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- Section - General

  --[[
  -- FixCursorHold.nvim - fix a performance bug with Cursorhold
  -- https://github.com/antoinemadec/FixCursorHold.nvim
  --]]
  use('antoinemadec/FixCursorHold.nvim')

  --[[
  -- lsp config
  -- https://github.com/neovim/nvim-lspconfig
  --]]
  use({
    'neovim/nvim-lspconfig',
    requires = { 'jose-elias-alvarez/nvim-lsp-ts-utils', 'jose-elias-alvarez/null-ls.nvim' },
    config = function()
      require('lsp.lsp')
    end,
  })

  --[[
  -- nvim-lsp-ts-utils
  -- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
  --]]
  use('jose-elias-alvarez/nvim-lsp-ts-utils')

  --[[
  -- null-ls
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  --]]
  use('jose-elias-alvarez/null-ls.nvim')

  --[[
  -- lsp-colors - fill in lsp colors if colorscheme doesn't support it
  -- https://github.com/folke/lsp-colors.nvim
  --]]
  use({
    'folke/lsp-colors.nvim',
    config = function()
      require('plugins.lsp-colors.config')
    end,
  })

  --[[
  -- lspkind-nvim - pictograms for lsp completion
  -- https://github.com/onsails/lspkind-nvim
  -- ]]
  use('onsails/lspkind-nvim')

  --[[
  -- plenary.nvim - lua methods
  -- https://github.com/nvim-lua/plenary.nvim
  --]]
  use('nvim-lua/plenary.nvim')

  --[[
  -- nvim-compe - Auto completion plugin for nvim
  -- https://github.com/hrsh7th/nvim-compe
  --]]
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      -- 'quangnguyen30192/cmp-nvim-ultisnips',
    },
    config = function()
      require('plugins.nvim-cmp.config')
    end,
  })
  use({
    'tzachar/cmp-tabnine',
    requires = 'hrsh7th/nvim-cmp',
    run = './install.sh',
  })

  --[[
  -- ultisnips - snippet engine
  -- https://github.com/SirVer/ultisnips
  --]]
  use({
    'SirVer/ultisnips',
    requires = 'honza/vim-snippets',
    config = function()
      require('plugins.ultisnips.config')
    end,
  })

  --[[
  -- jellybeans-nvim - my favorite colorscheme ported to lua <3
  -- https://github.com/metalelf0/jellybeans-nvim
  -- https://github.com/rktjmp/lush.nvim - built with lush
  --]]
  use({
    'metalelf0/jellybeans-nvim',
    requires = 'rktjmp/lush.nvim',
    config = function()
      require('colorscheme')
    end,
  })

  --[[
  -- vim-surround - provides mappings to easily delete, change and add such surroundings in pairs.
  -- https://github.com/tpope/vim-surround#surroundvim
  --]]
  use('tpope/vim-surround')

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
  -- vim-dispatch-neovim - adds support for neovim's terminal emulator to vim-dispatch
  -- https://github.com/radenling/vim-dispatch-neovim#dispatch-neovim
  -- https://github.com/tpope/vim-dispatch#dispatchvim
  --]]
  use({
    'radenling/vim-dispatch-neovim',
    requires = 'tpope/vim-dispatch',
    opt = true,
    cmd = { 'Dispatch', 'Make', 'Focus', 'Start' },
  })

  --[[
  -- Comment.nvim - easy commenting
  -- https://github.com/numToStr/Comment.nvim
  --]]
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.comment.config')
    end,
  })

  --[[
  -- vim-visual-multi - multiple cursors
  -- https://github.com/mg979/vim-visual-multi
  --]]
  use({
    'mg979/vim-visual-multi',
    opt = true,
    event = 'InsertEnter',
  })

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
  -- FZF - fuzzy finder
  -- https://github.com/junegunn/fzf
  -- fzf-lua - lua port of fzf.vim
  -- https://github.com/ibhagwan/fzf-lua
  --]]
  use({
    'junegunn/fzf',
    requires = 'vijaymarupudi/nvim-fzf',
    dir = '~/.fzf',
    run = './install --all',
    config = function()
      require('plugins.fzf.config')
    end,
  })
  use({
    'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons',
    },
  })

  --[[
  -- nvim-autopairs - automatically close brackets
  -- https://github.com/windwp/nvim-autopairs
  --]]
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.auto-pairs.config')
    end,
  })

  --[[
  -- vim_current_word - highlight matches to the word under the cursor
  -- https://github.com/dominikduda/vim_current_word
  --]]
  use('dominikduda/vim_current_word')

  --[
  -- vim-which-key - display available keybindings in a popup
  -- https://github.com/liuchengxu/vim-which-key
  --]
  use('liuchengxu/vim-which-key')

  --[[
  -- nvim-web-devicons - neato icons
  -- https://github.com/kyazdani42/nvim-web-devicons
  --]]
  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.nvim-devicons.config')
    end,
  })

  --[[
  -- nvim-tree - file explorer tree
  -- https://github.com/kyazdani42/nvim-tree.lua
  --]]
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.nvim-tree.config')
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
      require('plugins.lualine.config')
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
      require('plugins.barbar.config')
    end,
  })

  --[[
  --nvim-treesitter - better syntax highlighting
  --https://github.com/nvim-treesitter/nvim-treesitter
  --]]
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter.config')
    end,
  })

  --[[
  -- vim-gutentags - generate tags for a project for go to definition
  -- https://github.com/ludovicchabant/vim-gutentags
  --]]
  --
  use({
    'ludovicchabant/vim-gutentags',
    config = function()
      require('plugins.vim-gutentags.config')
    end,
  })

  --[[
  -- minimap.vim - minimap
  -- https://github.com/wfxr/minimap.vim
  --]]
  use({
    'wfxr/minimap.vim',
    config = function()
      require('plugins.minimap.config')
    end,
  })

  ----[[
  ---- vim-choosewin - choose which window to jump to
  ---- https://github.com/t9md/vim-choosewin
  ----]]
  use({
    't9md/vim-choosewin',
    config = function()
      require('plugins.choosewin.config')
    end,
  })

  --[[
  -- trouble.nvim - a diagnostics view
  -- https://github.com/folke/trouble.nvim
  --]]
  use({
    'folke/trouble.nvim',
    config = function()
      require('plugins.trouble.config')
    end,
  })

  --[[
  -- impatient.nvim - hopefully speeds up startup times
  -- https://github.com/lewis6991/impatient.nvim.git
  --]]
  use('lewis6991/impatient.nvim')

  --[[
  -- filetype.nvim - faster filetype detection loading
  -- https://github.com/nathom/filetype.nvim
  --]]
  use('nathom/filetype.nvim')

  --[[
  -- nvim-spectre - search/replace tool
  -- https://github.com/nvim-pack/nvim-spectre
  --]]
  use({
    'windwp/nvim-spectre',
    config = function()
      require('plugins.nvim-spectre.config')
    end,
  })

  --[[
  -- nvim-code-action-menu - floating window for code actions
  -- https://github.com/weilbith/nvim-code-action-menu
  --]]
  -- use({
  --   'weilbith/nvim-code-action-menu',
  --   cmd = 'CodeActionMenu',
  --   requires = 'kosayoda/nvim-lightbulb',
  -- })

  --[[
  -- lspsaga - floating window for various things
  -- https://github.com/tami5/lspsaga.nvim
  --]]
  use({
    'tami5/lspsaga.nvim',
    opt = true,
    requires = 'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lspsaga.config')
    end,
    cmd = { 'Lspsaga' },
    ft = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'lua',
    },
  })

  --TODO: Look into: https://github.com/glepnir/lspsaga.nvim
  -- It has a code action menu and a bunch of other floating windows

  --[[
  -- nvim-code-action-lightbulb - gutter notification for code actions
  -- https://github.com/kosayoda/nvim-lightbulb
  --]]
  use({
    'kosayoda/nvim-lightbulb',
    config = function()
      require('plugins.nvim-lightbulb.config')
    end,
  })

  -- EndSection - General

  -- Section - Bash

  --[[
  -- vim-shellcheck - bash script linter
  -- https://github.com/itspriddle/vim-shellcheck
  --]]
  use({
    'itspriddle/vim-shellcheck',
    opt = true,
    ft = { 'sh' },
    config = function()
      require('plugins.shellcheck.config')
    end,
  })

  -- EndSection - Bash

  -- Section - JS/TS

  --[[
  -- vim-fixjson - JSON autoformat + fixer
  -- https://github.com/rhysd/vim-fixjson
  --]]
  use({
    'rhysd/vim-fixjson',
    opt = true,
    ft = { 'json', 'json5' },
    config = function()
      require('plugins.fix-json.config')
    end,
  })

  --[[
  -- nvim-ts-autotag - jsx/tsx tag closing
  -- https://github.com/windwp/nvim-ts-autotag
  --]]
  use({
    'windwp/nvim-ts-autotag',
    requires = { 'nvim-treesitter' },
  })

  --[[
  -- json5 - support/highlighting for json5
  -- https://github.com/gutenye/json5.vim
  --]]
  use({
    'GutenYe/json5.vim',
    opt = true,
    ft = { 'json5' },
  })

  -- EndSection - JS/TS

  -- Section - Markdown

  --[[
  -- markdown-preview - opens markdown in a browser window + live updating
  -- https://github.com/iamcco/markdown-preview.nvim
  --]]
  use({
    'iamcco/markdown-preview.nvim',
    opt = true,
    ft = { 'markdown' },
    run = 'cd app && yarn install',
    config = function()
      require('plugins.markdown-preview.config')
    end,
  })

  --[[
  -- plantuml-syntax - highlighting for plantuml
  -- https://github.com/aklt/plantuml-syntax
  --]]
  use({
    'aklt/plantuml-syntax',
    opt = true,
    ft = { 'markdown', 'plantuml' },
  })

  -- EndSection - Markdown

  -- Section - Git

  --[[
  -- lazygit.nvim - LazyGit support
  -- https://github.com/kdheepak/lazygit.nvim
  --]]
  use({
    'kdheepak/lazygit.nvim',
    config = function()
      require('plugins.lazygit.config')
    end,
  })

  --[[
  -- vim-signify - adds git highlighting to the line number
  -- https://github.com/mhinz/vim-signify
  --]]
  use('mhinz/vim-signify')

  --[[
  -- git-blame.nvim - adds git blame in virtual text
  -- https://github.com/f-person/git-blame.nvim
  --]]
  use({
    'f-person/git-blame.nvim',
    opt = true,
    cmd = { 'GitBlameToggle' },
    config = function()
      require('plugins.git-blame.config')
    end,
  })

  --[[
  -- diffview - a git diff viewer
  -- https://github.com/sindrets/diffview.nvim
  --]]
  use({
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    opt = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
    config = function()
      require('plugins.diff-view.config')
    end,
  })

  -- EndSection - Git

  -- Section - Debugging

  --[[
  -- vim-startuptime - get startup time stats
  -- https://github.com/dstein64/vim-startuptime
  --]]
  use('dstein64/vim-startuptime')

  -- EndSection - Debugging
  if PackerBootstrap then
    require('packer').sync()
  end
end)
