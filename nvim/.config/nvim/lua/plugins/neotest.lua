return {
	"nvim-neotest/neotest",
	dependencies = {
		"vim-test/vim-test",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-vim-test",
		"rouge8/neotest-rust",
	},
	event = "BufReadPre",
	config = function()
		local opts = {
			adapters = {
				require("neotest-go")({
					experimental = {
						test_table = true,
					},
					args = { "-coverprofile cover.out" },
				}),
				require("neotest-python")({
					dap = { justMyCode = false },
					runner = "unittest",
				}),
				require("neotest-plenary"),
				require("neotest-vim-test")({
					ignore_file_types = { "python", "vim", "lua" },
				}),
				require("neotest-rust"),
			},
		}
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
		require("neotest").setup(opts)
	end,
}
