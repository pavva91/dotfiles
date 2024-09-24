-- SETTINGS PLUGINS -----------------------------------------------------------------

-- Set Colorscheme folke/tokyonight.nvim
vim.cmd.colorscheme 'tokyonight-night'

-- Set Colorscheme navarasu/onedark.nvim
-- vim.cmd.colorscheme 'onedark'

-- Set Colorscheme marko-cerovac/material.nvim
-- vim.cmd.colorscheme 'material'

-- Material Style
vim.g.material_style = 'deep ocean'

-- to change run this Ex command: :lua require('material.functions').find_style()
--
---------------------------------------------------------------------------
-- => FZF https://github.com/junegunn/fzf.vim
---------------------------------------------------------------------------
-- let g:fzf_command_prefix = 'Fzf'
-- DOESN'T WORK
vim.g.fzf_command_prefix = 'Fzf'
-- vim.cmd([[
-- let g:fzf_command_prefix = 'Fzf'
-- ]])

---------------------------------------------------------------------------
-- => Treesitter
---------------------------------------------------------------------------
vim.treesitter.language.register('html', 'xhtml')

---------------------------------------------------------------------------
-- => vim-dadbod-completion
---------------------------------------------------------------------------

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'sql', 'mysql', 'plsql' },
	callback = function()
		require('cmp').setup.buffer({
			sources = {
				{ name = 'luasnip' },
				{ name = 'vim-dadbod-completion' },
				{ name = 'treesitter' },
			},
			formatting = {
				fields = { 'menu', 'abbr', 'kind' },
				format = function(entry, item)
					local menu_icon = {
						luasnip = '[SNIP]',
						['vim-dadbod-completion'] = ' ',
						treesitter = '[TS]',
					}

					item.menu = menu_icon[entry.source.name]
					return item
				end,
			},
		})
		vim.schedule(function()
			print(' DB Chad Mode: ON!')
		end)
	end
})
