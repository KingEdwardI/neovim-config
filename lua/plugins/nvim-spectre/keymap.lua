local utils = require('utils')
local set_keymap = utils.set_keymap

set_keymap('n', ',ss', ':lua require("spectre").open()<cr>', {})
set_keymap('n', ',sw', ':lua require("spectre").open_visual({select_word=true})<cr>', {})
set_keymap('n', ',sf', ':lua require("spectre").open_file_search()<cr>', {})
