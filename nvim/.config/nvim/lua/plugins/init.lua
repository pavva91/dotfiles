return {
	-- NOTE: First, some plugins that don't require any configuration
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		-- event = "VeryLazy",
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

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	--  NOTE: Surrounding (e.g: surround 1 word with '()': ysw), surround 2 lines with '{}' ys2j} )
	--  ysw( : surround 1 word with '(   )' with heading and trailing spaces
	--  cs"' - Change "hello" to 'hello'
	-- "https://vimawesome.com/plugin/surround-vim
	-- "tpope/vim-surround",

	-- NOTE: Shortcuts with [b ]b for buffer, a for argument, q quickfix, l location,
	-- t tags, [e exchange current line with line above ]e exchange with line
	-- below
	-- ]f to to the next file in the folder, [f go to the previous file in the
	-- folder
	"tpope/vim-unimpaired",
	"tpope/vim-repeat",

	-- NOTE: Subvert: Substitution on steroids (:%Subvert/facilit{y,ies}/building{,s}/g)
	-- :Subvert/blog{,s}/post{,s}/g  (you can do that also with normal :s)
	-- You can abbreviate it as :S, and it accepts the full range of flags including things like c (confirm).
	-- Go with the cursor on the word and then:
	--	- MixedCase (crm); (ClassNames)
	--	- camelCase (crc), (objectNames, variableNames)
	--	- snake_case (crs), (pythonVariableName, javascript_folder_convention)
	--	- UPPER_CASE (cru), (CONSTANT_NAMES)
	--	This one are not recoverable, they break the word (w)
	--	- dash-case (cr-), (kebab-case)
	--	- dot.case (cr.),
	--	- space case (cr<space>),
	--	- Title Case (crt)
	"tpope/vim-abolish",

	-- NOTE: Database Explorer (dadbod)
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{
				"tpope/vim-dadbod",
				lazy = true,
			},
			{
				"jristijanhusak/vim-dadbod-completion",
				ft = { 'sql', 'mysql', 'plsql' },
				lazy = true,
				dependencies = {
					"hrsh7th/nvim-cmp",
					"tpope/vim-dadbod",
					"kristijanhusak/vim-dadbod-ui",
				},
			}
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	-- {
	-- 	"jristijanhusak/vim-dadbod-completion",
	-- 	ft = { 'sql', 'mysql', 'plsql' },
	-- 	lazy = true,
	-- 	dependencies = {
	-- 		"hrsh7th/nvim-cmp",
	-- 		"tpope/vim-dadbod",
	-- 		"kristijanhusak/vim-dadbod-ui",
	-- 	},
	-- },
	"nelstrom/vim-visual-star-search",
	"junegunn/vim-easy-align",
	"windwp/nvim-ts-autotag",
	opts = {
		autotag = {
			enable = true,
		},
	},

	"christoomey/vim-tmux-navigator",
	"junegunn/fzf",
	"junegunn/fzf.vim",
	"mbbill/undotree",
	"mfussenegger/nvim-jdtls",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,

		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			indent = { char = "┊" }
		},
	},
	{
		"numToStr/Comment.nvim",
		-- event = "VeryLazy",
		key = "gc",
		opts = {}
	},

	-- NOTE: Themes
	"tomasr/molokai",
	"morhetz/gruvbox",
	"sheerun/vim-wombat-scheme",
}
