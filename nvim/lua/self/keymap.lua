local telescope = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', telescope.find_files, { desc = 'Telescope find_files' })
vim.keymap.set('n', '<C-g>', telescope.live_grep, { desc = 'Telescope live_grep' })
vim.keymap.set('n', '<C-i>', function ()
  vim.diagnostic.open_float(nil, { scope = "cursor" })
end, { desc = '' })
