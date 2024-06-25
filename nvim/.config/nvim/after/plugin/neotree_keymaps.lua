-- Toggle File System Explorer
vim.keymap.set('n', '<F3>', "<cmd>Neotree toggle<cr>", { desc = 'Open File System Explorer' })
vim.keymap.set('n', '<leader>ee', "<cmd>Neotree toggle<cr>", { desc = 'Open File System Explorer' })
vim.keymap.set('n', '\\', "<cmd>Neotree toggle<cr>", { desc = 'Open File System Explorer' })
vim.keymap.set('n', '<leader>pt', "<cmd>Neotree toggle<cr>", { desc = 'Open File System Explorer (neotree)' })
vim.keymap.set('n', '<leader>O', "<cmd>Neotree reveal left<cr>", { desc = '[F]ile [O]pen Repo current buffer (neotree)' })
-- NOTE: I have the :Ex %% to do the same of <leader>fo with netRW
-- NOTE: I have the :Ex %:h<CR> to do the same of <leader>fo with netRW (<leader>fp)
