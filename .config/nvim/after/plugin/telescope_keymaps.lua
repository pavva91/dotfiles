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

local telescope = require("telescope.builtin")

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
			telescope.find_files,
			"[F]ind [F]iles",
		},
		h = {
			telescope.help_tags,
			"[F]ind [H]elp",
		},
		w = {
			telescope.grep_string,
			"[F]ind current [W]ord",
		},
		G = {
			telescope.live_grep,
			"[F]ind by [G]rep",
		},
		d = {
			telescope.diagnostics,
			"[F]ind [D]iagnostics",
		},
		j = {
			telescope.jumplist,
			"[F]ind [J]ump list",
		},
		m = {
			telescope.marks,
			"[F]ind [M]arks",
		},
		r = {
			telescope.resume,
			"[F]ind [R]esume",
		},
		b = {
			telescope.buffers,
			"[F]ind [B]uffers",
		},
		k = {
			telescope.keymaps,
			"[F]ind [K]eymaps",
		},
		s = {
			telescope.git_status,
			"[F]ind Git [S]tatus and Diff",
		},
		c = {
			telescope.git_commits,
			"[F]ind Git [C]ommits",
		},
		g = {
			telescope.git_files,
			"[F]ind [G]it Files (hidden files)",
		},
	},
}

which_key.register(mappings, opts)

-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n","gr", telescope.lsp_references,{ desc =  "[G]oto [R]eferences" })
vim.keymap.set("n","<leader><space>", telescope.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n","<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	telescope.builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n","<leader>ds", telescope.lsp_document_symbols,{ desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n","<leader>ws", telescope.lsp_dynamic_workspace_symbols,{ desc = "[W]orkspace [S]ymbols" })

-- vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
-- vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
-- vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
-- vim.keymap.set("n", "<leader>fG", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
-- vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind [D]iagnostics" })
-- vim.keymap.set("n", "<leader>fj", require("telescope.builtin").jumplist, { desc = "[F]ind [J]ump list" })
-- vim.keymap.set("n", "<leader>fm", require("telescope.builtin").marks, { desc = "[F]ind [M]arks" })

-- resume from last search
-- vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "[F]ind [R]esume" })
-- vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind [B]uffers" })
-- vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "[F]ind [K]eymaps" })

-- Git
-- vim.keymap.set("n", "<leader>fs", require("telescope.builtin").git_status, { desc = "[F]ind Git [S]tatus and Diff" })
-- vim.keymap.set("n", "<leader>fc", require("telescope.builtin").git_commits, { desc = "[F]ind Git [C]ommits" })
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>fg",
-- 	require("telescope.builtin").git_files,
-- 	{ desc = "[F]ind [G]it Files (hidden files)" }
-- )
