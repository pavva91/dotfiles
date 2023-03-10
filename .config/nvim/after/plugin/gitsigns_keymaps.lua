-- Git Signs
vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next [H]unk' })
vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Previous [H]unk' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', { desc = 'Git Diff Open File' })
vim.keymap.set('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Git Diff Open File' })
vim.keymap.set('n', '<leader>sh', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Stage Hunk' })
vim.keymap.set('n', '<leader>sH', '<cmd>Gitsigns undo_stage_hunk<cr>', { desc = 'Undo Stage Hunk' })
