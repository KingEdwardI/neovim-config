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
    echo "Error occurred while initializing Packer"
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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerCompile
  augroup end
]])

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

local setup_core = invariant_require('plugins.core')
local setup_ui = invariant_require('plugins.ui')

return packer.startup(function(use)
  use({
    'wbthomason/packer.nvim',
    config = function()
      local present, telescope = pcall(require, 'telescope')

      if present then
        telescope.load_extension('packer')
      end
    end,
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-telescope/telescope-packer.nvim',
      'nvim-lua/plenary.nvim',
    },
  })

  setup_core(use)
  setup_ui(use)

  if PackerBootstrap then
    require('packer').sync()
  end
end)
