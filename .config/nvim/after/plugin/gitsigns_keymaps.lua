-- Git Signs
vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next [H]unk' })
vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Previous [H]unk' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', { desc = '[G]it [D]iff Open Buffer' })
vim.keymap.set('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', { desc = '[G]it Preview [H]unk the cursor is on' })
vim.keymap.set('n', '<leader>sh', '<cmd>Gitsigns stage_hunk<cr>', { desc = '[S]tage [H]unk' })
vim.keymap.set('n', '<leader>sH', '<cmd>Gitsigns undo_stage_hunk<cr>', { desc = 'Undo [S]tage [H]unk' })
vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns select_hunk<cr>', { desc = '[H]unk [S]elect where the cursor is on' })
vim.keymap.set({ "n", "v" }, '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>',
{ desc = '[H]unk [R]eset where the cursor is on' })
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', { desc = 'Toggle [G]it [B]lame Current Line' })
