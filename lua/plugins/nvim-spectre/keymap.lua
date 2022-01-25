local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', '<Leader>ss', '<Cmd>lua require("spectre").open()<CR>', {})
set_keymap('n', '<Leader>sw', '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>', {})
set_keymap('n', '<Leader>sf', '<Cmd>lua require("spectre").open_file_search()<CR>', {})
