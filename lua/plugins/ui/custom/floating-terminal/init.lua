local nui = require('nui')

local terminal = nui.Terminal.new({ })

local open_term = function()
  terminal:open({
    layout = nui.layout.centered({
      width = 0.9,
      height = 0.9,
    }),
  })
end

local close_term = function()
terminal:close()
end

vim.api.nvim_set_keymap('n', '<Leader>ht', '<Cmd>lua open_term()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>hT', '<Cmd>lua close_term()<CR>', { noremap = true, silent = true })
