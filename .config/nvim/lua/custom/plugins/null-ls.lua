return {
	'jose-elias-alvarez/null-ls.nvim',
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		require("null-ls").setup {
			sources = {
				-- BASH
				require("null-ls").builtins.formatting.shfmt, -- shell script formatting
				require("null-ls").builtins.diagnostics.shellcheck, -- shell script diagnostics
				require("null-ls").builtins.code_actions.shellcheck, -- shell script code actions

				-- Prettier
				require("null-ls").builtins.formatting.prettier, -- markdown formatting

				-- ESLint
				require("null-ls").builtins.code_actions.eslint,

				-- Refactoring (https://github.com/ThePrimeagen/refactoring.nvim)
				require("null-ls").builtins.code_actions.refactoring.with({
					Filetypes = { "go", "javascript", "lua", "python", "typescript" }
				})

				-- Spell suggestions code completion
				-- require("null-ls").builtins.completion.spell,

			}
		}
	end
	-- opts = {
	-- sources = {
	-- 	require('null-ls').builtins.formatting.shfmt, -- shell script formatting
	-- }
	-- }
}
