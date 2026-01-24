local telescope = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', telescope.find_files, { desc = 'Telescope find_files' })
