-- Git
vim.keymap.set('n', '<leader>gm', '<cmd>Gvdiffsplit!<CR>', { desc = '[G]it [M]erge conflict diff 3-way Vertical Split' })
vim.keymap.set('n', '<leader>gs', '<cmd>G<CR>', { desc = '[G]it [S]tatus Fugitive' })
vim.keymap.set('n', '<leader>gg', '<cmd>G log --oneline --decorate --graph --all<CR>', { desc = '[G]it [G]raph Output' })
