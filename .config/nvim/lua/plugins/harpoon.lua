return {
	"ThePrimeagen/harpoon",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}
