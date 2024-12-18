return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}
