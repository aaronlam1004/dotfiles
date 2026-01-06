vim.api.nvim_create_user_command('E', function()
  vim.cmd('Explore')
end, { desc = 'Explore' })
