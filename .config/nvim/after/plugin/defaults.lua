-- KEY-BINDINGS PLUGINS -----------------------------------------------------------------

-- Toggle File System Explorer
vim.keymap.set('n', '<F3>', "<cmd>NeoTreeShowToggle<cr>", { desc = 'Open File System Explorer' })

-- Telescope, resume from last search
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
