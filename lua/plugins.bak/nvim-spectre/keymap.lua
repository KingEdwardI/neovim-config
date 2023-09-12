local wk = require('which-key')

local wk_mappings = {
  prefix = '<Leader>',
  s = {
    name = 'Spectre actions',
    s = {
      '<Cmd>lua require("spectre").open()<CR>',
      'Open Spectre',
    },
    w = {
      '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      'Open Spectre with currently selected word',
      mode = 'v',
    },
    l = {
      '<Cmd>lua require("spectre").open_visual()<CR>',
      'Open Spectre with current selection',
      mode = 'v',
    },
    f = {
      '<Cmd>lua require("spectre").open_file_search()<CR>',
      'Open Spectre only for current file',
    },
  },
}

wk.register(wk_mappings)
