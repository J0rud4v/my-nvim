local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  --snippet = {
  --  expand = function(args)
  --    luasnip.lsp_expand(args.body)
  --  end,
  --},
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirmar selección

    -- Mapeo para cerrar el popup de autocompletado
    ['<C-e>'] = cmp.mapping.close(),

    -- Opcional: Mapeo para abrir el popup manualmente si no está visible
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp', priority = 3},
    { name = 'buffer', priority = 1},
    { name = 'path', priority = 2 },
    --{ name = 'luasnip', priority = 4 },
  },
  
  completion = {
    completeopt = 'menu,menuone,noinsert',  -- Cómo se muestra el menú de autocompletado
  },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
