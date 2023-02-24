return {
	-- Try integration from vim
	----

	-- Abbreviation
	-- Substitution on steroids (:%Subvert/facilit{y,ies}/building{,s}/g)
	-- :Subvert/blog{,s}/post{,s}/g  (you can do that also with normal :s)
	-- You can abbreviate it as :S, and it accepts the full range of flags including things like c (confirm).
	-- Coercion (crs : coerce to snake case : Turn 'fooBar' into 'foo_bar')
	-- MixedCase (crm); camelCase (crc), snake_case (crs), UPPER_CASE (cru),
	-- dash-case (cr-), dot.case (cr.), space case (cr<space>), Title Case (crt)
	'tpope/vim-abolish',
	-- * and # Search for the current selection in Visual mode
	'nelstrom/vim-visual-star-search',
	-- Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	'junegunn/vim-easy-align',
	--- Start Page
	'mhinz/vim-startify',
	-- {{ Autopairs
	-- ---> closing XML tags <---
	-- 'alvan/vim-closetag',
	-- new plugin for neovim
	'windwp/nvim-ts-autotag',
	opts = {
		autotag = {
			enable = true,
		}

	},
	--  --- Surrounding (e.g: surround 1 word with '()': ysw), surround 2 lines with '{}' ys2j} )
	--  ysw( : surround 1 word with '(   )' with heading and trailing spaces
	--  cs"' - Change "hello" to 'hello'
	-- "https://vimawesome.com/plugin/surround-vim
	'tpope/vim-surround',
	-- Shortcuts with [b ]b for buffer, a for argument, q quickfix, l location,
	-- t tags, [e exchange current line with line above ]e exchange with line
	-- below
	-- ]f to to the next file in the folder, [f go to the previous file in the
	-- folder
	'tpope/vim-unimpaired',
	--- Enable . to repeat also plugin commands
	'tpope/vim-repeat',
	--- Undotree (emacs)
	'mbbill/undotree',
	-- TMux - Vim integration
	'christoomey/vim-tmux-navigator',
	-- ---> git changes on the gutter <---
	-- 'airblade/vim-gitgutter',

	-- Debug
	-- 'puremourning/vimspector',
	'tomasr/molokai',
	'morhetz/gruvbox',
	'sheerun/vim-wombat-scheme',
	'ap/vim-css-color',
}
