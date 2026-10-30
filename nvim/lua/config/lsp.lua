vim.lsp.config['clangd'] = {
  cmd = { 'clangd' },
  filetypes = { 'cpp', 'c' }
}

vim.lsp.enable('clangd')
vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
