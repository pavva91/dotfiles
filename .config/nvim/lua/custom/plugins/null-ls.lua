return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("null-ls").setup({
			sources = {
				-- BASH
				require("null-ls").builtins.formatting.shfmt, -- shell script formatting
				require("null-ls").builtins.diagnostics.shellcheck, -- shell script diagnostics
				require("null-ls").builtins.code_actions.shellcheck, -- shell script code actions

				-- FORMATTING
				-- Prettier
				require("null-ls").builtins.formatting.prettier, -- markdown formatting
				require("null-ls").builtins.formatting.stylua, -- lua formatting

				-- ESLint
				require("null-ls").builtins.code_actions.eslint,
				require("null-ls").builtins.formatting.eslint,

				-- GitSigns
				require("null-ls").builtins.code_actions.gitsigns,

				-- Text Lint - The pluggable linting tool for text and Markdown.
				-- require("null-ls").builtins.diagnostics.textlint

				-- Refactoring (https://github.com/ThePrimeagen/refactoring.nvim)
				-- require("null-ls").builtins.code_actions.refactoring.with({
				-- 	Filetypes = { "go", "javascript", "lua", "python", "typescript" }
				-- })

				-- Spell suggestions code completion
				-- require("null-ls").builtins.completion.spell,

				-- Dictionary - show available definition
				-- require("null-ls").builtins.hover.dictionary,
			},
		})
	end,
	-- opts = {
	-- sources = {
	-- 	require('null-ls').builtins.formatting.shfmt, -- shell script formatting
	-- }
	-- }
}
