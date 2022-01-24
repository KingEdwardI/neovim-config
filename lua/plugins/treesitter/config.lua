require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'go',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'jsonc',
    'lua',
    'typescript',
    'tsx',
    'vim',
    'bash',
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  autotag = { enable = true },
  rainbow = { enable = true },
  context_commentstring = { enable = true },
  -- refactor = {highlight_definitions = {enable = true}}
})
