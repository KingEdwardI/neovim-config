local wk = require('which-key')

local wk_mappings = {
  prefix = '<Leader>',
  p = {
    name = 'Packer actions',
    u = {
      '<Cmd>PackerUpdate<CR>',
      'Update packages',
    },
    c = {
      '<Cmd>PackerCompile<CR> <Cmd>echo "finished compiling"<CR>',
      'Compile packages',
    },
    i = {
      '<Cmd>PackerInstall<CR> <Cmd>echo "finished installing"<CR>',
      'Install packages',
    },
    C = {
      '<Cmd>PackerClean<CR> <Cmd>echo "finished cleaning"<CR>',
      'Clean packages',
    },
    s = {
      '<Cmd>PackerSync<CR>',
      'Sync packages',
    },
  },
}

wk.register(wk_mappings)
