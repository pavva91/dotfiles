return {
	-- NOTE: First, some plugins that don't require any configuration

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- NOTE: Abbreviation
	-- NOTE: Substitution on steroids (:%Subvert/facilit{y,ies}/building{,s}/g)
	-- NOTE: :Subvert/blog{,s}/post{,s}/g  (you can do that also with normal :s)
	-- NOTE: You can abbreviate it as :S, and it accepts the full range of flags including things like c (confirm).
	-- NOTE: Coercion (crs : coerce to snake case : Turn 'fooBar' into 'foo_bar')
	-- NOTE: MixedCase (crm); camelCase (crc), snake_case (crs), UPPER_CASE (cru),
	-- NOTE: dash-case (cr-), dot.case (cr.), space case (cr<space>), Title Case (crt)
	"tpope/vim-abolish",
	-- * and # Search for the current selection in Visual mode
	"nelstrom/vim-visual-star-search",
	-- Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	"junegunn/vim-easy-align",
	--- Start Page
	-- 'mhinz/vim-startify',
	-- {{ Autopairs
	-- ---> closing XML tags <---
	-- 'alvan/vim-closetag',
	-- new plugin for neovim
	"windwp/nvim-ts-autotag",
	opts = {
		autotag = {
			enable = true,
		},
	},

	--  --- Surrounding (e.g: surround 1 word with '()': ysw), surround 2 lines with '{}' ys2j} )
	--  ysw( : surround 1 word with '(   )' with heading and trailing spaces
	--  cs"' - Change "hello" to 'hello'
	-- "https://vimawesome.com/plugin/surround-vim
	"tpope/vim-surround",
	-- Shortcuts with [b ]b for buffer, a for argument, q quickfix, l location,
	-- t tags, [e exchange current line with line above ]e exchange with line
	-- below
	-- ]f to to the next file in the folder, [f go to the previous file in the
	-- folder
	"tpope/vim-unimpaired",
	--- Enable . to repeat also plugin commands
	"tpope/vim-repeat",
	--- Undotree (emacs)
	"mbbill/undotree",
	-- TMux - Vim integration
	"christoomey/vim-tmux-navigator",
	-- ---> git changes on the gutter <---
	-- 'airblade/vim-gitgutter',

	-- Debug
	-- 'puremourning/vimspector',
	"tomasr/molokai",
	"morhetz/gruvbox",
	"sheerun/vim-wombat-scheme",
	-- Fuzzy Finder
	"junegunn/fzf",
	"junegunn/fzf.vim",
	-- Undo Tree
	"mbbill/undotree",
	-- Vim LaTeX support
	-- 'lervag/vimtex'
	"mfussenegger/nvim-jdtls",
	{ "folke/which-key.nvim",  opts = {} },
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			indent = { char = "┊" }
			-- char = "┊",
			-- show_trailing_blankline_indent = false,
		},
	},

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

}
