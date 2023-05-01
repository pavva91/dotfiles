local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ma", mark.add_file, { desc = 'Harpoon [M]ark [A]dd File' })
vim.keymap.set("n", "<leader>mm", ui.toggle_quick_menu, { desc = 'Harpoon [M]enu of [M]arks' })

vim.keymap.set("n", "[k", function() ui.nav_prev() end, { desc = 'Harpoon go to Previous File' })
vim.keymap.set("n", "]k", function() ui.nav_next() end, { desc = 'Harpoon go to Next File' })

vim.keymap.set("n", "<leader>mh", function() ui.nav_file(1) end, { desc = 'Harpoon go to [M] [H]one' })
vim.keymap.set("n", "<leader>mj", function() ui.nav_file(2) end, { desc = 'Harpoon go to [M] [J]two' })
vim.keymap.set("n", "<leader>mk", function() ui.nav_file(3) end, { desc = 'Harpoon go to [M] [K]three' })
vim.keymap.set("n", "<leader>ml", function() ui.nav_file(4) end, { desc = 'Harpoon go to [M] [L]four' })
