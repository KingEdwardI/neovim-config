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
      '<Cmd>PackerCompile<CR> <Cmd>lua require("notify")("Finished compiling")<CR>',
      'Compile packages',
    },
    i = {
      '<Cmd>PackerInstall<CR> <Cmd>lua require("notify")("Finished installing")<CR>',
      'Install packages',
    },
    C = {
      '<Cmd>PackerClean<CR> <Cmd>lua require("notify")("Finished cleaning")<CR>',
      'Clean packages',
    },
    s = {
      '<Cmd>PackerSync<CR>',
      'Sync packages',
    },
    p = {
      '<Cmd>Telescope packer<CR>',
      'Open Packer Menu',
    },
  },
}

wk.register(wk_mappings)
