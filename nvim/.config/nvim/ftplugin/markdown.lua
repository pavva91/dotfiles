vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true


-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
