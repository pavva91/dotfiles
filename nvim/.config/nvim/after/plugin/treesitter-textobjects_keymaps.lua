-- javascript treesitter keymaps
vim.api.nvim_create_autocmd("FileType", {
	-- group = augroup("javascript_treesitter_keymap"),
	group = vim.api.nvim_create_augroup("javascript_treesitter_keymaps", { clear = true }),
	pattern = {
		"javascript",
	},
	callback = function()
		local ts_textobjects_move = require("nvim-treesitter.textobjects.move")

		vim.keymap.set("n", "]v",
			function()
				ts_textobjects_move.goto_next_start("@vardef.outer")
			end,
			{ desc = "Next variable definition start" }
		)

		vim.keymap.set("n", "]{",
			function()
				ts_textobjects_move.goto_next_start("@mustache.open")
			end,
			{ desc = "Next mustache open" }
		)

		vim.keymap.set("n", "]}",
			function()
				ts_textobjects_move.goto_next_start("@mustache.close")
			end,
			{ desc = "Next mustache close" }
		)

		vim.keymap.set("n", "[v",
			function()
				ts_textobjects_move.goto_previous_start("@vardef.outer")
			end,
			{ desc = "Previous variable definition start" }
		)

		vim.keymap.set("n", "[{",
			function()
				ts_textobjects_move.goto_previous_start("@mustache.open")
			end,
			{ desc = "Previous mustache open" }
		)

		vim.keymap.set("n", "[}",
			function()
				ts_textobjects_move.goto_previous_start("@mustache.close")
			end,
			{ desc = "Previous mustache close" }
		)
	end,
})
