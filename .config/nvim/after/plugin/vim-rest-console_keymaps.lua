-- NOTE: Run VRC when you are on a .rest file and on a not commented line
vim.keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>", { desc = "e[X]ecute [R]EST Query" })
vim.keymap.set("n", "<leader>rr", ":call VrcQuery()<CR>", { desc = "[R]un [R]EST Query" })
