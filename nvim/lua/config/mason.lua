require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_enable = {
    'clangd',
    'lua_ls',
    'pyright'
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end
  }
})
