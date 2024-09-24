return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim"
	},
	config = function ()
		local telescope = require("telescope")

		-- first setup telescope
		telescope.setup({
			-- your config
		})

		-- then load the extension
		telescope.load_extension("live_grep_args")
	end

}
