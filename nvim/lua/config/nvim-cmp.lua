local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  completion ={
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' }
  },
  mapping = cmp.mapping.preset.insert({
    ["<tab>"] = cmp.mapping.select_next_item(), -- Navigate next
    ["<s-tab>"] = cmp.mapping.select_prev_item(), -- Navigate previous
    ["<enter>"] = cmp.mapping.confirm({ select = true }), -- Accept suggestion
  }),
})
