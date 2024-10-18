-- Set LSP keymaps (commented are overwritten by LSP Saga)

-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
-- 	{ desc = '[R]e[n]ame' })
-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
-- 	{ desc = '[C]ode [A]ction' })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition' })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references,
-- 	{ desc = '[G]oto [R]eferences' })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type [D]efinition" })
vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- See `:help K` for why this keymap
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover,
-- 	{ desc = 'Hover Documentation' })
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
-- 	{ desc = 'Signature Documentation' })

-- Lesser used LSP functionality
-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })

-- vim.keymap.set("n", "<leader>wl", function()
-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, { desc = "[W]orkspace [L]ist Folders" })

vim.keymap.set("n", "<leader>hh", vim.lsp.buf.signature_help, { desc = "Signature [H][H]elp Documentation" })
vim.keymap.set('n', "<leader>sh", vim.lsp.buf.signature_help, { desc = "[S]ignature [H]elp Documentation" })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "List diagnostic current buffer" })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.setloclist, { desc = "List diagnostics current buffer" })
vim.keymap.set('n', '<leader>bd', vim.diagnostic.setloclist, { desc = "List current open [B]uffer [D]iagnostics" })

