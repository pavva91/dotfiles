-- Git Signs
vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next [H]unk" })
vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous [H]unk" })
-- vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "[G]it [D]iff Open Buffer" })
-- vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", { desc = "[G]it Preview [H]unk the cursor is on" })
-- vim.keymap.set("n", "<leader>sh", "<cmd>Gitsigns stage_hunk<cr>", { desc = "[S]tage [H]unk" })
-- vim.keymap.set("n", "<leader>sH", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo [S]tage [H]unk" })
-- vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns select_hunk<cr>", { desc = "[H]unk [S]elect where the cursor is on" })
vim.keymap.set(
	{ "n", "v" },
	"<leader>hr",
	"<cmd>Gitsigns reset_hunk<cr>",
	{ desc = "[H]unk [R]eset where the cursor is on" }
)
vim.keymap.set(
	"n",
	"<leader>gb",
	"<cmd>Gitsigns toggle_current_line_blame<cr>",
	{ desc = "Toggle [G]it [B]lame Current Line" }
)

-- As suggested from https://github.com/lewis6991/gitsigns.nvim
local gs = package.loaded.gitsigns

-- Navigation
vim.keymap.set("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		gs.next_hunk()
	end)
	return "<Ignore>"
end, { expr = true, desc = "Next [C]hange (Hunk)" })

vim.keymap.set("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		gs.prev_hunk()
	end)
	return "<Ignore>"
end, { expr = true, desc = "Previous [C]hange (Hunk)" })

-- Actions
vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "[H]unk [S]tage" })
vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "[H]unk [R]eset" })
vim.keymap.set("v", "<leader>hs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[H]unk [S]tage" })
vim.keymap.set("v", "<leader>hr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[H]unk [R]eset" })
vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "[H]unk [S]tage Current Buffer" })
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[H]unk [U]ndo Stage Hunk" })
vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "[H]unk [R]eset Current buffer" })
vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "[H]unk [P]review Hunk" })
vim.keymap.set("n", "<leader>hb", function()
	gs.blame_line({ full = true })
end, { desc = "[H]unk [B]lame Line" })
vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame Current Line" })
vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "[H]unk [D]iff this" })
vim.keymap.set("n", "<leader>hD", function()
	gs.diffthis("~")
end, { desc = "[H]unk [D]iff ~" })
vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { desc = "[T]oggle [D]eleed" })
vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "???" })

-- Text object
vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "???" })
