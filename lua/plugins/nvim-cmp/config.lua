local utils = require('utils')
local invariant_require = utils.invariant_require
-- Setup nvim-cmp.
-- local tabnine = invariant_require('cmp_tabnine.config')
local lspkind = invariant_require('lspkind')
local cmp = invariant_require('cmp')
-- local luasnip_vscode_loaders = invariant_require('luasnip.loaders.from_vscode')
local luasnip = invariant_require('luasnip')
local luasnip_snippets = invariant_require('luasnip_snippets')

local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  -- cmp_tabnine = '[TN]',
  path = '[Path]',
}

if lspkind and cmp and luasnip and luasnip_snippets then
  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        -- vim.fn['vsnip#anonymous'](args.body)

        -- For `luasnip` user.
        luasnip.lsp_expand(args.body)
        luasnip.snippets = luasnip_snippets.load_snippets()

        -- For `ultisnips` user.
        -- vim.fn['UltiSnips#Anon'](args.body)
      end,
    },
    mapping = {
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-t>'] = cmp.mapping.scroll_docs(-4),
      ['<C-n>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-c>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    completion = {},
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },

      -- For TabNine
      -- { name = 'cmp_tabnine' },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        local menu = source_mapping[entry.source.name]
        -- if entry.source.name == 'cmp_tabnine' then
        --   if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
        --     menu = entry.completion_item.data.detail .. ' ' .. menu
        --   end
        --   vim_item.kind = ''
        -- end
        vim_item.menu = menu
        return vim_item
      end,
    },
  })

  -- tabnine
  -- tabnine:setup({
  --   max_lines = 1000,
  --   max_num_results = 20,
  --   sort = true,
  --   run_on_every_keystroke = true,
  --   snippet_placeholder = '..',
  -- })
end
