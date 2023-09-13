local utils = require('utils')

return function()
  local node_version = utils.get_node_version()
  local neovim_exists_for_node_version =
    utils.is_neovim_npm_installed(node_version)

  if not neovim_exists_for_node_version then
    -- Absolute npm requirements for typescript to work
    local base_packages = {
      'neovim',
      'typescript',
      'typescript-language-server',
      'eslint',
      'eslint_d',
      'prettier',
    }
    -- Additional packages that are less important
    local additional_packages = { 'cspell', 'markdownlint-cli', 'markdownlint' }
    local install_command = 'npm install --location=global -g'
      .. ' '
      .. table.concat(base_packages, ' ')
      .. ' '
      .. table.concat(additional_packages, ' ')

    os.execute(install_command)

    --speed up finding the neovim node library
    vim.cmd(
      "let g:node_host_prog = '/Users/edward.vetterdrake/.nvm/versions/node/"
        .. node_version
        .. "/bin/neovim-node-host'"
    )
  end
end
