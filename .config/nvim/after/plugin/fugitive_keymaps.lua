-- Git
vim.keymap.set('n', '<leader>gm', '<cmd>Gvdiffsplit!<CR>', { desc = '[G]it [M]erge conflict diff 3-way Vertical Split' })
vim.keymap.set('n', '<leader>gs', '<cmd>G<CR>', { desc = '[G]it [S]tatus Fugitive' })
-- vim.keymap.set('n', '<leader>gg', '<cmd>G log --oneline --decorate --graph --all<CR>', { desc = '[G]it [G]raph Output' })
vim.keymap.set('n', '<leader>gg', '<cmd>G log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit --decorate --date=short<CR>', { desc = '[G]it [G]raph Output' })
vim.keymap.set('n', '<leader>gG', '<cmd>G log --graph --abbrev-commit --decorate --date=short<CR>', { desc = '[G]it [G]raph Output' })
vim.keymap.set('n', '<leader>gp', '<cmd>G push<CR>', { desc = '[G]it [P]ush' })
