local keymap = vim.keymap.set

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

local ld = require("lspsaga.diagnostic")

local next_diagnostic_repeat, prev_diagnostic_repeat = ts_repeat_move.make_repeatable_move_pair(
	function()
		ld:goto_next()
	end,
	function()
		ld:goto_prev()
	end
)

vim.keymap.set("n", "]d", next_diagnostic_repeat, { desc = 'Diagnostic jump forward' })
vim.keymap.set("n", "[d", prev_diagnostic_repeat, { desc = 'Diagnostic jump backward' })

local next_error_repeat, prev_error_repeat = ts_repeat_move.make_repeatable_move_pair(
	function()
		ld:goto_next({ severity = vim.diagnostic.severity.ERROR })
	end,
	function()
		ld:goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end
)

vim.keymap.set("n", "]e", next_error_repeat, { desc = 'Error jump forward' })
vim.keymap.set("n", "[e", prev_error_repeat, { desc = 'Error jump backward' })

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga finder<CR>",
	{ desc = 'Finder, find the symbol\'s definition' })

-- keymap("n", "gf", "<cmd>Lspsaga finder<CR>",
-- 	{ desc = '[G]o [F]ind, find the symbol\'s definition' })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>",
	{ desc = '[C]ode [A]ction' })

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>",
	{ desc = '[R]e[N]ame all occurrences of the hovered word for the entire file' })

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "<leader>cw", "<cmd>Lspsaga rename<CR>",
	{ desc = '[R]e[N]ame all occurrences of the hovered word for the entire file' })

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "<leader>rf", "<cmd>Lspsaga rename ++project<CR>",
	{ desc = '[R]ename all occurrences of the hovered word for the selected [F]iles' })

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>",
	{ desc = '[G]o to [P]eek definition' })

-- Go to definition
-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>",
-- 	{ desc = '[G]o to [D]efinition' })

-- Go to definition in new vertical split
-- keymap("n", "gD", "<cmd>vs<CR><cmd>Lspsaga goto_definition<CR>",
-- 	{ desc = '[G]o to [D]efinition' })

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>",
-- { desc = 'Peek type definition' })

-- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>",
	{ desc = '[G]o to [T]ype definition' })


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>",
	{ desc = '[S]how [L]ine diagnostics' })

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>",
	{ desc = '[S]how [C]ursor diagnostics' })

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>",
	{ desc = '[S]how [B]uffer diagnostics' })

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location

-- keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>",
-- 	{ desc = 'Diagnostic Jump Backward' })
-- keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>",
-- 	{ desc = 'Diagnostic Jump Forward' })

-- Diagnostic jump with filters such as only jumping to an error

-- keymap("n", "[e", function()
-- 		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- 	end,
-- 	{ desc = 'Error Jump Backward' })
-- keymap("n", "]e", function()
-- 		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- 	end,
-- 	{ desc = 'Error Jump Forward' })

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>",
	{ desc = 'Toggle outline (jump into outlined element with "o")' })

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
-- Please make sure you install markdown and markdown_inline parser
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>",
	{ desc = 'Hover Doc' })

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- Please make sure you install markdown and markdown_inline parser
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>",
-- { desc = 'Hover Doc Keep' })

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>",
	{ desc = 'Call Hierarchy Incoming Calls' })
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>",
	{ desc = 'Call Hierarchy Outgoing Calls' })

-- Floating terminal (Alt-d)
-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>",
-- 	{ desc = 'Floating Terminal (Alt-d)' })
