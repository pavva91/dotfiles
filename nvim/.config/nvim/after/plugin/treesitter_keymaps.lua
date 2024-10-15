local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n",  -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	t = {
		name = "Telescope",
		x = {
			":lua vim.treesitter.stop()<CR>",
			"[T]elescope Stop(x)",
		},
		r = {
			":lua vim.treesitter.start()<CR>",
			"[T]elescope [R]un",
		},
	},
}

which_key.register(mappings, opts)
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/keys.lua
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

local telescopebuiltin = require("telescope.builtin")

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n",  -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	f = {
		name = "Telescope (Finder)",
		f = {
			telescopebuiltin.find_files,
			"[F]ind [F]iles",
		},
		h = {
			telescopebuiltin.help_tags,
			"[F]ind [H]elp",
		},
		w = {
			telescopebuiltin.grep_string,
			"[F]ind current [W]ord",
		},
		g = {
			telescopebuiltin.live_grep,
			"[F]ind by [G]rep",
		},
		d = {
			telescopebuiltin.diagnostics,
			"[F]ind [D]iagnostics",
		},
		j = {
			telescopebuiltin.jumplist,
			"[F]ind [J]ump list",
		},
		m = {
			telescopebuiltin.marks,
			"[F]ind [M]arks",
		},
		r = {
			telescopebuiltin.resume,
			"[F]ind [R]esume",
		},
		b = {
			telescopebuiltin.current_buffer_fuzzy_find,
			"[F]uzzy find in current [B]uffer",
		},
		k = {
			telescopebuiltin.keymaps,
			"[F]ind [K]eymaps",
		},
		s = {
			telescopebuiltin.git_status,
			"[F]ind Git [S]tatus and Diff",
		},
		c = {
			telescopebuiltin.command_history,
			"[F]ind Command History",
		},
		C = {
			telescopebuiltin.git_commits,
			"[F]ind Git [C]ommits",
		},
		G = {
			telescopebuiltin.git_files,
			"[F]ind [G]it Files (hidden files)",
		},
	},
}

which_key.register(mappings, opts)

-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n","gr", telescopebuiltin.lsp_references,{ desc =  "[G]oto [R]eferences" })
vim.keymap.set("n","<leader><space>", telescopebuiltin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n","<leader>/", telescopebuiltin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n","<leader>ds", telescopebuiltin.lsp_document_symbols,{ desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n","<leader>ws", telescopebuiltin.lsp_dynamic_workspace_symbols,{ desc = "[W]orkspace [S]ymbols" })

local telescope = require("telescope")
vim.keymap.set("n","<leader>rg", require('telescope').extensions.live_grep_args.live_grep_args,{ desc = "[R]ip [G]rep" })
