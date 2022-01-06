require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  autotag = { enable = true },
  rainbow = { enable = true },
  context_commentstring = { enable = true },
  -- refactor = {highlight_definitions = {enable = true}}
})
