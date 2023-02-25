-- KEY-BINDINGS PLUGINS -----------------------------------------------------------------

-- Toggle File System Explorer
vim.keymap.set('n', '<F3>', "<cmd>NeoTreeShowToggle<cr>", { desc = 'Open File System Explorer' })

-- Telescope
-- resume from last search
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })

-- Treehopper
vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
