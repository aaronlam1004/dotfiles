-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Line Endings
vim.opt.fileformats = "unix"

-- Color Scheme
vim.cmd('colorscheme sorbet')

-- Transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
