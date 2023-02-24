-- KEY-BINDING VANILLA -----------------------------------------------------------------

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- 2 or 4 spaces tab
vim.keymap.set('n', '<leader>2', '<cmd>set autoindent expandtab tabstop=2 shiftwidth=2<CR>',
	{ desc = 'Change indentation to 2 spaces' })

vim.keymap.set('n', '<leader>4', '<cmd>tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent<CR>',
	{ desc = 'Change indentation to 4 spaces' })

-- vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>',
--   { desc = 'Save Current Open Buffer' })

-- highlight last inserted text
vim.keymap.set('n', 'gV', '`[v`]',
	{ desc = 'Highlight Last Inserted Text' })

-- Switch CWD to the directory of the open buffer
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR><cmd>pwd<cr>',
	{ desc = 'Switch CWD to the Directory of the Open Buffer' })

-- turn off search highlight
vim.keymap.set('n', '<leader>,', '<cmd>nohlsearch<CR>',
	{ desc = 'Turn off Search Highlight' })

-- Replace all is aliased to S
vim.keymap.set('n', 'S', ':%s//gc<left><left><left>',
	{ desc = 'Save Current Open Buffer' })

-- SPELL TOGGLE
-- Pressing ,ss will toggle and untoggle spell checking
vim.keymap.set('n', '<leader>ss', '<cmd>setlocal spell!<cr>',
	{ desc = 'Toggle Spell Checking' })

-- Copy to clipboard
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')

-- Paste from clipboard
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')

-- Reload our configuration
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
